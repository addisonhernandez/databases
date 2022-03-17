var models = require('../models');

module.exports = {
  get: function (req, res) {
    models.users.getAll(function (error, userData) {
      if (error) {
        console.error(error);
      } else {
        res.send(userData);
      }
    });
  },

  post: function (req, res) {
    models.users.create(req.body.username, function (error, postUser) {
      if (error) {
        console.error(error);
      } else {
        res.send(postUser);
      }
    });
  }
};
