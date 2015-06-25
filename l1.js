function reg_custom() {
    respecEvents.sub('end-all', function () {
        clean_regex();
        clean_implicitthis();
        clean_unscopeable();
        clean_maplike_setlike();
    });
}

function remove_prodlines_nodes(parent, matchstring, nb) {
    for (var i = 0; i < parent.childNodes.length; i++) {
        var n = parent.childNodes[i];
        if ((n.nodeType == 3) && ( n.data.indexOf(matchstring) >= 0 )) {
            for (var j = 1; j < nb; j++) {
                parent.removeChild(n.nextSibling);
            }
            parent.removeChild(n);
            break;
        }
    }
}
// RegExp
function clean_regex() {
    var matchstring = "RegExp";

    function remove_span(idname) {
        var spanlist = $("#" + idname + " .estype");
        for (var i = 0; i < spanlist.length; i++) {
            var sp = spanlist[i];
            if ((sp.firstChild.nodeType == 3) && (sp.firstChild.data.indexOf(matchstring) >= 0)) {
                sp.parentNode.removeChild(sp.previousSibling);
                sp.parentNode.removeChild(sp);
            }
        }
    }

    $("#proddef-NonAnyType .prod-lines").each(function (i, val) {
        remove_prodlines_nodes(val, matchstring, 4)
    });
    $("#idl-union .prod-lines").each(function (i, val) {
        remove_prodlines_nodes(val, matchstring, 3)
    });
    $("#idl-extended-attributes .prod-lines").each(function (i, val) {
        remove_prodlines_nodes(val, matchstring, 3)
    });
    $("#prod-Other .prod-lines").each(function (i, val) {
        remove_prodlines_nodes(val, matchstring, 2)
    });
    $("#prod-NonAnyType .prod-lines").each(function (i, val) {
        remove_prodlines_nodes(val, matchstring, 4)
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

// maplike/setlike
function clean_maplike_setlike() {
    var mapstring = "maplike";
    var setstring = "setlike";
    $("#proddef-ArgumentNameKeyword .prod-lines").each(function (i, val) {
        remove_prodlines_nodes(val, mapstring, 2);
        remove_prodlines_nodes(val, setstring, 2);
    });
    $("#idl-operations table.grammar .prod-lines").each(function (i, val) {
        remove_prodlines_nodes(val, mapstring, 2);
        remove_prodlines_nodes(val, setstring, 2);
    });
    $("#proddef-InterfaceMember a[href='#prod-ReadWriteMaplike']").each(function(i, val) {
        var p = val.parentNode;
        p.removeChild(val.previousSibling);
        p.removeChild(val.previousSibling);
        p.removeChild(val);
    });
    $("#proddef-InterfaceMember a[href='#prod-ReadWriteSetlike']").each(function(i, val) {
        var p = val.parentNode;
        p.removeChild(val.previousSibling);
        p.removeChild(val.previousSibling);
        p.removeChild(val);
    });
    // more complex rewriting...
    var a = $("#idl-iterable a[href='#dfn-maplike-declaration']")[0];
    var p = a.parentNode;
    p.removeChild(a.nextSibling);
    p.removeChild(a.nextSibling);
    // we eat up to the .
    while (a.previousSibling.nodeType != 3 || (a.previousSibling.data.indexOf('.') < 0)) {
        p.removeChild(a.previousSibling);
    }
    p.removeChild(a.previousSibling);
    p.removeChild(a);
    // text rewriting for Global
    a = $("#Global a[href='#dfn-maplike-declaration']")[0];
    p = a.parentNode;
    p.removeChild(a.nextSibling);
    p.removeChild(a.nextSibling);
    // we eat up to the .
    while (a.previousSibling.nodeType != 3 || (a.previousSibling.data.indexOf('or more than one') < 0)) {
        p.removeChild(a.previousSibling);
    }
    var rep = p.removeChild(a.previousSibling);
    // now ew remove the text node before and replace it with this one.
    var oa = a.previousElementSibling;
    p.removeChild(oa.previousSibling);
    p.insertBefore(rep, oa);
    p.removeChild(a);

    $("#es-iterator li > a.dfnref[href='#dfn-maplike-declaration']")[0].parentNode.remove();
    $("#es-iterator li > a.dfnref[href='#dfn-setlike-declaration']")[0].parentNode.remove();
    p = $("#es-iterator p > a.dfnref[href='#dfn-maplike-declaration']")[0].parentNode;
    p.nextElementSibling.remove();
    p.remove();

    $("#es-forEach li > a.dfnref[href='#dfn-maplike-declaration']")[0].parentNode.remove();
    $("#es-forEach li > a.dfnref[href='#dfn-setlike-declaration']")[0].parentNode.remove();

    p = $("#es-forEach p > a.dfnref[href='#dfn-setlike-declaration']")[0].parentNode;
    p.nextElementSibling.remove();
    p.remove();
}
