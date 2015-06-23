function reg_custom() {
	respecEvents.sub('end-all', function(){
		clean_regex();
});
}

function clean_regex() {
	function remove_n_children(parent, nb) {
		for (var i=0; i<parent.childNodes.length; i++) {
			var n = parent.childNodes[i];
			if ((n.nodeType == 3) && ( n.data.indexOf("RegExp") >= 0 )) {
				for (var j=1; j<nb; j++) {
					parent.removeChild(n.nextSibling);
				}
				parent.removeChild(n);
				break;
			}
		}
	}
	var tl = document.getElementById('proddef-NonAnyType').getElementsByClassName("prod-lines")[0];
	remove_n_children(tl, 4);

	var plines = document.getElementById('idl-union').getElementsByClassName("prod-lines");
	for (var i=0; i<plines.length; i++) {
		var pline = plines[i];
		remove_n_children(pline, 3);
	}
        plines = document.getElementById('idl-extended-attributes').getElementsByClassName("prod-lines");
        for (var i=0; i<plines.length; i++) {
                var pline = plines[i];
		remove_n_children(pline, 3);
        }
	tl = document.getElementById('prod-Other').getElementsByClassName("prod-lines")[0];
	remove_n_children(tl, 2);

	tl = document.getElementById('prod-NonAnyType').getElementsByClassName("prod-lines")[0];
	remove_n_children(tl, 4);
}
	
