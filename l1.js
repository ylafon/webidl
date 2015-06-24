function reg_custom() {
    respecEvents.sub('end-all', function () {
        clean_regex();
        clean_implicitthis();
        clean_unscopeable();
    });
}

// RegExp
function clean_regex() {
    function remove_n_children(parent, nb) {
        for (var i = 0; i < parent.childNodes.length; i++) {
            var n = parent.childNodes[i];
            if ((n.nodeType == 3) && ( n.data.indexOf("RegExp") >= 0 )) {
                for (var j = 1; j < nb; j++) {
                    parent.removeChild(n.nextSibling);
                }
                parent.removeChild(n);
                break;
            }
        }
    }

    function remove_span(idname) {
        var spanlist = $("#" + idname + " .estype");
        for (var i = 0; i < spanlist.length; i++) {
            var sp = spanlist[i];
            if ((sp.firstChild.nodeType == 3) && (sp.firstChild.data.indexOf("RegExp") >= 0)) {
                sp.parentNode.removeChild(sp.previousSibling);
                sp.parentNode.removeChild(sp);
            }
        }
    }

    $("#proddef-NonAnyType .prod-lines").each(function (i, val) {
        remove_n_children(val, 4)
    });
    $("#idl-union .prod-lines").each(function (i, val) {
        remove_n_children(val, 3)
    });
    $("#idl-extended-attributes .prod-lines").each(function (i, val) {
        remove_n_children(val, 3)
    });
    $("#prod-Other .prod-lines").each(function (i, val) {
        remove_n_children(val, 2)
    });
    $("#prod-NonAnyType .prod-lines").each(function (i, val) {
        remove_n_children(val, 4)
    });

    remove_span('es-dictionary');
    remove_span('es-sequence');
    remove_span('es-union');
    remove_span('es-interface-call');
    remove_span('es-user-objects');
    var p = $("#es-union a[href='#idl-RegExp']")[0].parentNode;
    p.parentNode.removeChild(p);
}

// [ImplicitThis]
function clean_implicitthis() {
    $("#idl-interfaces a[href='#ImplicitThis']").each(function (i, val) {
        val.parentNode.removeChild(val.previousSibling);
        val.parentNode.removeChild(val);
    });
    $("#es-operations a[href='#ImplicitThis']").each(function (i, val) {
        var li = val.parentNode;
        li.parentNode.removeChild(li);
    });
}

// [Unscopeable]
function clean_unscopeable() {
    var p = $("#interface-prototype-object p > a[href='#Unscopeable']")[0].parentNode;
    // remove the ol with the algorithm
    while (p.nextSibling.nodeType == 3) {
        p.parentNode.removeChild(p.nextSibling);
    }
    p.parentNode.removeChild(p.nextSibling);
    // then the paragraph itself
    p.parentNode.removeChild(p);
}
