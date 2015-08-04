`import Ember from 'ember'`

createEmberObject = ->
  Ember.Object.create()

###*
# Applies the supplied merge-patch to the supplied object.
#
# @see RFC7386
#
# A merge-patch indicates which values should be overridden.
# This utility helps you apply a merge-patch to any Ember Object.
# The merge-patch is expected to be supplied as a POJO, the
# object to which the merge-patch is to be applied can be any
# object, as long as Ember.set works on it.
#
# If the patch contains non-simple objects, this object is
# considered to be opaque.  Similar to a primitive value or an
# array, the value is set without further merging.
#
# @param object
#   The object to which the patch will be applied
# @param patch
#   The patch which will be applied
# @param newObject
#   Function which defines how we can create a new object
# @param verify (optional)
#   An object that holds the expected original values of
#   the object. The update of a property will only be executed if the current
#   value for the object matches the verification (else it is assumed
#   to already be overwritten). If verify is null, the update is executed
#   in any case.
# @return object
#   Returns object.  This is the original object, to which the
#   patch has been applied.  Note that this is *not* a clone of
#   object.
###
applyMergePatch = (object, patch, newObject=createEmberObject, verify=null) ->
  Object.keys(patch).map (k) ->
    switch
      # Patch nesting
      when Ember.typeOf( patch[k] ) == 'object'
        # Ensure there's an object to place content in
        unless ['object','instance'].contains Ember.typeOf( Ember.get(object, k) )
          Ember.set object, k, newObject()
        # Recursively apply the merge patch
        applyMergePatch Ember.get( object, k ), Ember.get( patch, k ), newObject, (verify and Ember.get(verify,k))
      # Patch delete key
      when patch[k] == null
        delete object[k]
      # Patch set value
      else
        # only set if verification is ok
        if not verify or Ember.get(verify,k) == Ember.get(object, k)
          Ember.set(object, k, patch[k])
  object

`export default applyMergePatch`
