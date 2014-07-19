###
  Dependencies
###
mongoose = require 'mongoose'
db = require './mongoose'

module.exports = (modelName) ->

  index = (request, response, next) ->
    db.model modelName
    .find {}, (error, data) ->
      next error if error
      response.send data

  get = (request, response, next) ->
    try
      id = mongoose.Types.ObjectId request.params.id
    catch e
      response.send 400
    db.model modelName
    .find {_id: id}, (error, data) ->
      next error if error
      if data
        response.send data
      else
        response.send 404

  create = (request, response, next) ->
    db.model modelName
    .create request.body, (error, data) ->
      next error if error
      response.send data

  update = (request, response, next) ->
    try
      id = mongoose.Types.ObjectId request.params.id
    catch e
      response.send 400
    db.model modelName
    .update {_id: id}, {$set: request.body}, (error, numberAffected, data) ->
      next error if error
      if numberAffected
        response.send 200
      else
        response.send 400

  remove = (request, response, next) ->
    try
      id = mongoose.Types.ObjectId request.params.id
    catch e
      response.send 400
    db.model modelName
    .remove {_id: id}, (error, data) ->
      next error if error
      response send if data then request.params.id else 404

  return {
  index: index
  get: get
  create: create
  update: update
  remove: remove
  }