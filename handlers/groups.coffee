mongoose = require '../config/mongoose'

modelName = 'groups'

handlers = require('../config/crudHandlers')(modelName)

module.exports = handlers