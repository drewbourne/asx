package asx.object {  
	
	import flash.errors.IllegalOperationError;
	
	/**
	 * Creates a new instance of a given Class, passing in a variable number of constructor args.
	 */
	public function newInstance_(klass:Class, ...args):Object {
		switch (args.length) {
			case 0: { return new klass(); }
			case 1: { return new klass(args[0]); }
			case 2: { return new klass(args[0], args[1]); }
			case 3: { return new klass(args[0], args[1], args[2]); }
			case 4: { return new klass(args[0], args[1], args[2], args[3]); }
			case 5: { return new klass(args[0], args[1], args[2], args[3], args[4]); }
			case 6: { return new klass(args[0], args[1], args[2], args[3], args[4], args[5]); }
			case 7: { return new klass(args[0], args[1], args[2], args[3], args[4], args[5], args[6]); }
			case 8: { return new klass(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]); }
			case 9: { return new klass(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]); }
			case 10: { return new klass(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]); }
			default:{ throw new IllegalOperationError("Unable to instantiate:" + klass + ", too many constructor arguments, received: " + args.join(', ')); }
		}
	}
}


