const functions = require('firebase-functions');
 
const admin = require('firebase-admin');
admin.initializeApp();
 
exports.notifyNewMessage = functions.firestore
    .document('pulse_log/{pulses}')
    .onCreate((docSnapshot, context) => {
        const pulseData = docSnapshot.data();
        const userId = pulseData['user_id'];
        const pulse = pulseData['pulse'];
        const time = Date(pulseData['timestamp']);
 
        return admin.firestore().doc(userId).get().then(userDoc => {
            const registrationTokens = userDoc.get('registrationTokens');
 
            const notificationBody = pulse + '\n' + time;
            const payload = {
                notification: {
                    title: "맥박 변화 감지",
                    body: notificationBody,
                    clickAction: "ChatActivity"
                },
                data: {
                    USER_NAME: '',
                    USER_ID: ''
                }
            }
 
            return admin.messaging().sendToDevice(registrationTokens, payload).then( response => {
                const stillRegisteredTokens = registrationTokens
 
                response.results.forEach((result, index) => {
                    const error = result.error
                    if (error) {
                        const failedRegistrationToken = registrationTokens[index]
                        console.error('blah', failedRegistrationToken, error)
                        if (error.code === 'messaging/invalid-registration-token'
                            || error.code === 'messaging/registration-token-not-registered') {
                                const failedIndex = stillRegisteredTokens.indexOf(failedRegistrationToken)
                                if (failedIndex > -1) {
                                    stillRegisteredTokens.splice(failedIndex, 1)
                                }
                            }
                    }
                })
 
                return admin.firestore().doc(userId).update({
                    registrationTokens: stillRegisteredTokens
                })
            })
        })
    })