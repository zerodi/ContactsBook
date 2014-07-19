path = require 'path'

module.exports = (mongoose) ->
  Schema = new mongoose.Schema(
    name:
      type: String
      required: true
    sex:
      type: String
      required: true
    accendance: Number
    phone: String
    email: String
    vk: String
  )

  return mongoose.model path.basename(module.filename, '.coffee'), Schema