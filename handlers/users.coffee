mongoose = require '../config/mongoose'

modelName = 'users'

handlers = require('../config/crudHandlers')(modelName)

module.exports = handlers