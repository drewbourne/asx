# todo

this document contains todos and ideas for asx. 

# return the top n items
# one pass, no sorting, selection algorithm
    asx.array.top(iterable, n:int):Array 

http://en.wikipedia.org/wiki/Selection_algorithm

# slicing

asx.array.take(iterable:Object, n:int):Array
asx.array.drop(iterable:Object, n:int):Array
// http://www.cs.chalmers.se/Cs/Grundutb/Kurser/d1pt/d1pta/ListDoc/take.html
// http://www.cs.chalmers.se/Cs/Grundutb/Kurser/d1pt/d1pta/ListDoc/drop.html
asx.array.split(iterable:Object, n:int):Array
// http://www.cs.chalmers.se/Cs/Grundutb/Kurser/d1pt/d1pta/ListDoc/splitAt.html

// group adjacent equal items
// group([hello]), h,e,ll,o
// map(group([hello]), head) h,e,l,o
asx.array.group(iterable:Object):Array

// all those at the start of the array that match the predicate
asx.array.span(iterable:Object, predicate:Function):Array
// all those at the start of the array until the first match of the predicate
asx.array.break(iterable:Object, predicate:Function):Array


asx.array.unionBy()
asx.array.intersectionBy()
asx.array.differenceBy()


# ordering
asx.array.reverse(iterable:Object):Array
asx.array.sort(iterable, compareFunction:Function=null):Array

# repeating

// http://www.cs.chalmers.se/Cs/Grundutb/Kurser/d1pt/d1pta/ListDoc/repeat.html
asx.array.repeat(value:Object, n:int):Array

// http://www.cs.chalmers.se/Cs/Grundutb/Kurser/d1pt/d1pta/ListDoc/cycle.html
asx.array.cycle(iterable:Object, n:int):Array

// http://www.cs.chalmers.se/Cs/Grundutb/Kurser/d1pt/d1pta/ListDoc/iterate.html
asx.array.iterate(value:Object, n:int, transformer:Function):Array

# zip
asx.array.zip(...iterables):Array
asx.array.zipWith(...iterables, zipFunction:Function):Array
asx.array.unzip(iterable:Object):Array

# fn
    asx.fn.returning(o:Object, fn:Function):Object {
        fn(o);
        return o;
    }

    asx.fn.seq([items], [select, _, odd], [inject, 0, _, add], [map, _, square])
    seq(range(1, 100), select(_, odd), inject(0, _, add), map(_, square))    

# bah!
(value).into(fn);

asx.external

- create a nicer API for registering and calling external functions


asx.string.substitute

- named placeholders, eg: substitute("named {marker}", { marker: "thingy" });

asx.object.pluck

- eg: pluck(object, "chain.to.follow.withSimpleMethods().too", defaultShouldAnyLinkBeNull=null)

asx.object.range

- see specs/asx/RangeSpecs.as for scattered thoughts about implementation

# strings

asx.string.lines(value:String):Array
asx.string.words(value:String):Array
asx.string.chars(value:String):Array

asx.string.unlines(lines:Object):String
asx.string.unwords(words:Object):String

asx.string.isAlpha(value:String):Boolean
asx.string.isDigit(value:String):Boolean
asx.string.isWhitespace(value:String):Boolean
asx.string.isAlphaNumeric(value:String):Boolean
asx.string.isAscii(value:String):Boolean
asx.string.isLowerCase(value:String):Boolean
asx.string.isUpperCase(value:String):Boolean

asx.string.urlFriendly(value:String):String
asx.string.isIDNA(value:String):String
asx.string.toIDNA(value:String):String
asx.string.fromIDNA(value:String):String


asx.xml.sax::

    stream-friendly parser
    
    var serializer:SaxSerializer = new SaxSerializer();
    serializer.registerClass(Media);
    serializer.unmarshall("<media>
        <id>42</id>
        <encodingProfiles>
            <encodingProfile></encodingProfile>
        </encodingProfiles>
    </media>");
    
    serializer.startElement("*", "media")
    serializer.startElement("*", "id")
    serializer.text("*", "42")
    serializer.endElement("*", "id")
    serializer.startElement("*", "encodingProfiles")
    serializer.startElement("*", "encodingProfile")
    serializer.endElement("*", "encodingProfile")
    serializer.endElement("*", "encodingProfiles")
    serializer.endElement("*", "media")

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