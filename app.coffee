###
  Dependencies
###
express = require 'express'
path = require 'path'
bodyParser = require 'body-parser'

config = require './config'
db = require './config/mongoose'
api = require './api'

###
  App
###
app = express()
router = express.Router()

app.use bodyParser.json()
router.get '/', (req, res) ->
  res.json {message: 'This is just an api'}

handlers =
  users: require './handlers/users'
  groups: require './handlers/groups'

api.setup router, handlers

db.init path.join(__dirname, 'models'), (error, data) ->
  console.log 'models initialised.'
  port = Number process.env.PORT or config.get('port')
  app.listen port, ->
    console.log 'App running on port: ' + port