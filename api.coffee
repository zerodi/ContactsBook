module.exports.setup = (router, handlers) ->
  ###
    Users routes
  ###
  router.route '/users'
    .get handlers.users.index
    .post handlers.users.create
  router.route '/users/:id'
    .get handlers.users.get
    .put handlers.users.update
    .delete handlers.users.remove
