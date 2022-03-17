var models = require('../models');

module.exports = {
  get: function (req, res) {
    // invoke models.messages.getAll, and serve the result

    models.messages.getAll(function (error, messageData) {
      if (error) {
        console.error(error);
      } else {
        res.send(messageData);
      }
    });


  }, // a function which handles a get request for all messages
  post: function (req, res) {

    models.messages.create(req.body, function (error, postMessage) {

      if (error) {
        console.error(error);
      } else {
        res.send(postMessage);
      }
    });
  } // a function which handles posting a message to the database
};
