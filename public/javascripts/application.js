// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.addBehavior({
    'body.show-page.bucket .card.bucket.droppable': function(event) {
        var bucket = this
        Droppables.add(this, {hoverclass:"hover", onDrop: function(card) {
            Hobo.ajaxUpdateField(card, "bucket", "@" + Hobo.modelIdFor(bucket), ["buckets"])
            card.remove()
        }})
    }
})
