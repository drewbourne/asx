asx.string.substitute

- named placeholders, eg: substitute("named {marker}", { marker: "thingy" });

asx.object.pluck

- eg: pluck(object, "chain.to.follow.withSimpleMethods().too", defaultShouldAnyLinkBeNull=null)

asx.object.range

- see specs/asx/RangeSpecs.as for scattered thoughts about implementation

asx.system.pp

- pretty prints given object(s) to asx.system.out
- prints the objects a AS3 code
- optional succinct output, without indentation?
- eg: pp({ field: value, field2: value })

    { 
        field: value,
        field2: value
    }

- eg: pp([array, [nested, array]])

    [
        array,
        [
            nested,
            array
        ]
    ]

asx.system.out
asx.system.err

- output streams, wrap trace() to allow forwarding to sockets, localconnection, etc. 