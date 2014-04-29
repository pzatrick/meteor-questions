


class ReactiveModel

  # You must override `collection` with a Meteor.Collection 
  # instance.
  collection: null

  # Override `defaults` with an object that contains default
  # values for the wrapped document. The default values will
  # be set in the server on construction of the model provided
  # that the document already exists in the collection, otherwise
  # the defaults will be set by ReactiveModel::insert()
  defaults: {}

  # Wrap the first document matched given selector in a reactive
  # model. The term "model" is used in the sense of 
  # Model-View-Controller separation of concerns in which a model
  # encapsulates data and the business rules around that data.
  #
  # selector - a Mongo DB selector
  #
  # [constructor]
  constructor: (selector) ->
    @_dep = new Deps.Dependency

    @collection = _.result this, 'collection'

    @select(selector)

    @_update @defaults

    @observation = @collection.find(selector).observe
      added: (doc) =>
        # maybe should be if doc is a supermap of selector?
        if @_insertCalled and EJSON.equals doc, selector
          @_dep.changed()
          @observation.stop()

  # Set the value of one or multiple fields in the modeled
  # document.
  #
  # ReactiveModel::set() can be called two ways: one-off and 
  # bulk. In the one off form the arguments are
  #
  # first - a String used as the key for the field to set
  # second - the value that will be set for the field
  # third - an options Object (optional)
  #
  # In the bulk form, the arguments are
  #
  # first - an Object that will be superimposed on the wrapped
  #         document
  # second - an options Object (optional)
  #
  # Returns true if successful
  set: (first, second, third) ->
    if _.isObject(first)
      @_setMany first, second
    else
      @_setOne first, second, third

  _update: (document, options = {}) ->
    if @collection.findOne(@_id)? 
      !!@collection.update @_id, 
        $set: document, options

  # Insert the wrapped document into the model's collection.
  #
  # options - an options Object (optional)
  #
  # Returns the unique _id of the inserted document
  insert: (options = {}) ->
    @_insertCalled = true
    document = _.defaults(_id: @_id, @defaults, @selector)
    @collection.insert document

  _setMany: (hash, options) ->
    hash = _.omit hash, '_id'

    @_update hash, options

  _setOne: (key, value, options) ->
    hash = {}
    hash[key] = value

    @_update hash, options

  # Get the whole wrapped document.
  #
  # Returns an Object
  getAll: ->
    @_dep.depend()
    @collection.findOne(@_id)

  # Get one field of the wrapped document.
  #
  # key - a String
  #
  # Returns the value associated with `key`
  get: (key) ->
    @getAll()?[key]

  # Test whether the wrapped document has been inserted yet.
  #
  # Returns a Boolean
  inserted: ->
    @getAll()?

  # Wrap the first document that matches given selector, 
  # potentially changing which document is being wrapped.
  #
  # newSelector - a Mongo DB selector
  #
  # Returns `this` 
  select: (newSelector) ->
    unless EJSON.equals @selector, newSelector
      @_dep.changed()
      @selector = newSelector
      @_id =
        if _.isNumber(@selector)
          "#{@selector}"
        else if _.isString(@selector)
          @selector
        else
          @collection.findOne(@selector)?._id or Random.id()
    this

  # Remove the wrapped document from the collection.
  #
  # Returns `this`
  remove: ->
    @collection.remove @_id
    this





