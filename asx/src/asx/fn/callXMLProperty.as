package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function callXMLProperty(method:String, ...args):* {
		return function(node:XML):* {
			switch(method) {
				case 'children':
					return node.children();
				case 'childIndex':
					return node.childIndex();
				case 'elements':
					return node.elements();
				case 'localName':
					return node.localName();
				case 'toString':
					return node.toString();
			}
		};
	}
}