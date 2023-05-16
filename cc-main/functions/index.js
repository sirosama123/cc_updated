const functions = require("firebase-functions");
const nodemailer = require("nodemailer");

exports.sendEmail = functions.https.onCall((data, context) => {
  const email = data.email;
  const cc = data.cc;
  const subject = data.subject;
  const body = data.body;
  const attachment = data.attachment;
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "Crescentcareapp@gmail.com",
      pass: "kxwvfujaijcvvjwq",
    },
  });

  const mailOptions = {
    from: "Crescentcareapp@gmail.com",
    to: email,
    cc: cc,
    subject: subject,
    text: body,
    attachments: [
      {
        path: attachment,
      },
    ],
  };

  return transporter.sendMail(mailOptions)
      .then(() => {
        console.log("Email sent to: "+email);
        return true;
      })
      .catch((error) => {
        console.log(error);
        return false;
      });
});
