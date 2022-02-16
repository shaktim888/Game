var _STRINGS = {
    Ad: {
        Mobile: {
            Preroll: {
                ReadyIn: "The game is ready in ",
                Loading: "Your game is loading...",
                Close: "Close"
            },
            Header: {
                ReadyIn: "The game is ready in ",
                Loading: "Your game is loading...",
                Close: "Close"
            },
            End: {
                ReadyIn: "Advertisement ends in ",
                Loading: "Please wait ...",
                Close: "Close"
            }
        }
    },
    Splash: {
        Loading: "Loading ...",
        LogoLine1: "Some text here",
        LogoLine2: "powered by MarketJS",
        LogoLine3: "none"
    },
    Game: {
        SelectPlayer: "Select Player",
        Win: "You win!",
        Lose: "You lose!",
        Score: "Score",
        Time: "Time",
        Turn: "Turn @@turnCount@@",
        Computer: "Computer",
        ComputerTurn: "Computer's Turn",
        Player: "Player",
        PlayerTurn: "Player's Turn",
        Color: "Color:",
        Easy: "Easy",
        Normal: "Normal",
        Hard: "Hard",
        ForceJump: "Forced Captures",
        FirstMove: "First Move:",
        Theme: "Theme:",
        ResetGame: "Changes apply next game. Start new game to play with latest rules.",
        ResetGame2: "Difficulty change resets winning streak.",
        Draw: "Draw!",
        Error1: "Kindly select your own piece.",
        Error2: "The square is occupied.",
        Error3: "Pieces can only move diagonally.",
        Error4: "This piece can only move forward.",
        Error5: "Cannot move more than two spaces.",
        Error6: "You can only move two spaces by capturing an opponent piece.",
        Error7: "Force capture rule is set, capture is possible, you must take it.",
        Error8: "Once a capture is started, all possible multi-captures must be made.",
        Error9: "Multi-capture must be made by the same piece.",
        WinStreak: "Winning Streak : ",
        BestWinStreak: "Best Winning Streak : ",
        CloseGameWin: "You can quit game now without losing your winning streak."
    },
    Results: {
        Title: "High score"
    }
};
var _SETTINGS = {
    API: {
        Enabled: !1,
        Log: {
            Events: {
                InitializeGame: !0,
                EndGame: !0,
                Level: {
                    Begin: !0,
                    End: !0,
                    Win: !0,
                    Lose: !0,
                    Draw: !0
                }
            }
        }
    },
    Ad: {
        Mobile: {
            Preroll: {
                Enabled: !1,
                Duration: 5,
                Width: 300,
                Height: 250,
                Rotation: {
                    Enabled: !1,
                    Weight: {
                        MobileAdInGamePreroll: 40,
                        MobileAdInGamePreroll2: 40,
                        MobileAdInGamePreroll3: 20
                    }
                }
            },
            Header: {
                Enabled: !1,
                Duration: 5,
                Width: 320,
                Height: 50,
                Rotation: {
                    Enabled: !1,
                    Weight: {
                        MobileAdInGameHeader: 40,
                        MobileAdInGameHeader2: 40,
                        MobileAdInGameHeader3: 20
                    }
                }
            },
            Footer: {
                Enabled: !1,
                Duration: 5,
                Width: 320,
                Height: 50,
                Rotation: {
                    Enabled: !1,
                    Weight: {
                        MobileAdInGameFooter: 40,
                        MobileAdInGameFooter2: 40,
                        MobileAdInGameFooter3: 20
                    }
                }
            },
            End: {
                Enabled: !1,
                Duration: 1,
                Width: 300,
                Height: 250,
                Rotation: {
                    Enabled: !1,
                    Weight: {
                        MobileAdInGameEnd: 40,
                        MobileAdInGameEnd2: 40,
                        MobileAdInGameEnd3: 20
                    }
                }
            }
        }
    },
    Language: {
        Default: "en"
    },
    DeveloperBranding: {
        Splash: {
            Enabled: !1
        },
        Logo: {
            Enabled: !1,
            Link: "http://marketjs.com",
            LinkEnabled: !1,
            NewWindow: !0,
            Width: 166,
            Height: 61
        }
    },
    Branding: {
        Splash: {
            Enabled: !1
        },
        Logo: {
            Enabled: !1,
            Link: "http://google.com",
            LinkEnabled: !0,
            NewWindow: !0,
            Width: 280,
            Height: 34
        }
    },
    MoreGames: {
        Enabled: !1,
        Link: "http://www.marketjs.com/game/links/mobile",
        NewWindow: !0
    },
    Gamecenter: {
        Enabled: !1
    }
};
var MobileAdInGamePreroll = {
   
};
var MobileAdInGameHeader = {
     
};
var MobileAdInGameFooter = {
     
};
var MobileAdInGameEnd = {
     
};
(function(b, c) {
    function d(b, v, z) {
        if (z === c && 1 === b.nodeType)
            if (z = "data-" + v.replace(sc, "-$1").toLowerCase(), z = b.getAttribute(z), "string" == typeof z) {
                try {
                    z = "true" === z ? !0 : "false" === z ? !1 : "null" === z ? null : +z + "" === z ? +z : tc.test(z) ? g.parseJSON(z) : z
                } catch (d) {}
                g.data(b, v, z)
            } else z = c;
        return z
    }

    function e(b) {
        for (var c in b)
            if (!("data" === c && g.isEmptyObject(b[c])) && "toJSON" !== c) return !1;
        return !0
    }

    function f() {
        return !1
    }

    function j() {
        return !0
    }

    function t(b) {
        return !b || !b.parentNode || 11 === b.parentNode.nodeType
    }

    function m(b,
        c) {
        do b = b[c]; while (b && 1 !== b.nodeType);
        return b
    }

    function r(b, c, d) {
        c = c || 0;
        if (g.isFunction(c)) return g.grep(b, function(b, B) {
            return !!c.call(b, B, b) === d
        });
        if (c.nodeType) return g.grep(b, function(b) {
            return b === c === d
        });
        if ("string" == typeof c) {
            var q = g.grep(b, function(b) {
                return 1 === b.nodeType
            });
            if (uc.test(c)) return g.filter(c, q, !d);
            c = g.filter(c, q)
        }
        return g.grep(b, function(b) {
            return 0 <= g.inArray(b, c) === d
        })
    }

    function x(b) {
        var c = xb.split("|");
        b = b.createDocumentFragment();
        if (b.createElement)
            for (; c.length;) b.createElement(c.pop());
        return b
    }

    function A(b, c) {
        if (1 === c.nodeType && g.hasData(b)) {
            var d, q, e;
            q = g._data(b);
            var p = g._data(c, q),
                l = q.events;
            if (l)
                for (d in delete p.handle, p.events = {}, l) {
                    q = 0;
                    for (e = l[d].length; q < e; q++) g.event.add(c, d, l[d][q])
                }
            p.data && (p.data = g.extend({}, p.data))
        }
    }

    function s(b, c) {
        var d;
        1 === c.nodeType && (c.clearAttributes && c.clearAttributes(), c.mergeAttributes && c.mergeAttributes(b), d = c.nodeName.toLowerCase(), "object" === d ? (c.parentNode && (c.outerHTML = b.outerHTML), g.support.html5Clone && b.innerHTML && !g.trim(c.innerHTML) &&
            (c.innerHTML = b.innerHTML)) : "input" === d && yb.test(b.type) ? (c.defaultChecked = c.checked = b.checked, c.value !== b.value && (c.value = b.value)) : "option" === d ? c.selected = b.defaultSelected : "input" === d || "textarea" === d ? c.defaultValue = b.defaultValue : "script" === d && c.text !== b.text && (c.text = b.text), c.removeAttribute(g.expando))
    }

    function C(b) {
        return "undefined" != typeof b.getElementsByTagName ? b.getElementsByTagName("*") : "undefined" != typeof b.querySelectorAll ? b.querySelectorAll("*") : []
    }

    function E(b) {
        yb.test(b.type) && (b.defaultChecked =
            b.checked)
    }

    function n(b, c) {
        if (c in b) return c;
        for (var d = c.charAt(0).toUpperCase() + c.slice(1), g = c, e = zb.length; e--;)
            if (c = zb[e] + d, c in b) return c;
        return g
    }

    function u(b, c) {
        return b = c || b, "none" === g.css(b, "display") || !g.contains(b.ownerDocument, b)
    }

    function y(b, c) {
        for (var d, q, e = [], p = 0, l = b.length; p < l; p++) d = b[p], d.style && (e[p] = g._data(d, "olddisplay"), c ? (!e[p] && "none" === d.style.display && (d.style.display = ""), "" === d.style.display && u(d) && (e[p] = g._data(d, "olddisplay", wa(d.nodeName)))) : (q = P(d, "display"), !e[p] &&
            "none" !== q && g._data(d, "olddisplay", q)));
        for (p = 0; p < l; p++)
            if (d = b[p], d.style && (!c || "none" === d.style.display || "" === d.style.display)) d.style.display = c ? e[p] || "" : "none";
        return b
    }

    function M(b, c, d) {
        return (b = vc.exec(c)) ? Math.max(0, b[1] - (d || 0)) + (b[2] || "px") : c
    }

    function Q(b, c, d, q) {
        c = d === (q ? "border" : "content") ? 4 : "width" === c ? 1 : 0;
        for (var e = 0; 4 > c; c += 2) "margin" === d && (e += g.css(b, d + da[c], !0)), q ? ("content" === d && (e -= parseFloat(P(b, "padding" + da[c])) || 0), "margin" !== d && (e -= parseFloat(P(b, "border" + da[c] + "Width")) || 0)) : (e +=
            parseFloat(P(b, "padding" + da[c])) || 0, "padding" !== d && (e += parseFloat(P(b, "border" + da[c] + "Width")) || 0));
        return e
    }

    function L(b, c, d) {
        var q = "width" === c ? b.offsetWidth : b.offsetHeight,
            e = !0,
            p = g.support.boxSizing && "border-box" === g.css(b, "boxSizing");
        if (0 >= q || null == q) {
            q = P(b, c);
            if (0 > q || null == q) q = b.style[c];
            if (xa.test(q)) return q;
            e = p && (g.support.boxSizingReliable || q === b.style[c]);
            q = parseFloat(q) || 0
        }
        return q + Q(b, c, d || (p ? "border" : "content"), e) + "px"
    }

    function wa(b) {
        if (Xa[b]) return Xa[b];
        var c = g("<" + b + ">").appendTo(D.body),
            d = c.css("display");
        c.remove();
        if ("none" === d || "" === d) {
            ka = D.body.appendChild(ka || g.extend(D.createElement("iframe"), {
                frameBorder: 0,
                width: 0,
                height: 0
            }));
            if (!la || !ka.createElement) la = (ka.contentWindow || ka.contentDocument).document, la.write("<!doctype html><html><body>"), la.close();
            c = la.body.appendChild(la.createElement(b));
            d = P(c, "display");
            D.body.removeChild(ka)
        }
        return Xa[b] = d, d
    }

    function ya(b, c, d, q) {
        var e;
        if (g.isArray(c)) g.each(c, function(c, v) {
            d || wc.test(b) ? q(b, v) : ya(b + "[" + ("object" == typeof v ? c : "") + "]",
                v, d, q)
        });
        else if (!d && "object" === g.type(c))
            for (e in c) ya(b + "[" + e + "]", c[e], d, q);
        else q(b, c)
    }

    function J(b) {
        return function(c, d) {
            "string" != typeof c && (d = c, c = "*");
            var q, e, p = c.toLowerCase().split(ea),
                l = 0,
                f = p.length;
            if (g.isFunction(d))
                for (; l < f; l++) q = p[l], (e = /^\+/.test(q)) && (q = q.substr(1) || "*"), q = b[q] = b[q] || [], q[e ? "unshift" : "push"](d)
        }
    }

    function U(b, v, d, g, e, p) {
        e = e || v.dataTypes[0];
        p = p || {};
        p[e] = !0;
        var l;
        e = b[e];
        for (var f = 0, j = e ? e.length : 0, n = b === Za; f < j && (n || !l); f++) l = e[f](v, d, g), "string" == typeof l && (!n || p[l] ? l =
            c : (v.dataTypes.unshift(l), l = U(b, v, d, g, l, p)));
        return (n || !l) && !p["*"] && (l = U(b, v, d, g, "*", p)), l
    }

    function Ab(b, v) {
        var d, q, e = g.ajaxSettings.flatOptions || {};
        for (d in v) v[d] !== c && ((e[d] ? b : q || (q = {}))[d] = v[d]);
        q && g.extend(!0, b, q)
    }

    function za() {
        try {
            return new b.XMLHttpRequest
        } catch (B) {}
    }

    function qa() {
        return setTimeout(function() {
            Aa = c
        }, 0), Aa = g.now()
    }

    function Bb(b, c, d) {
        var q, e = 0,
            p = Ba.length,
            l = g.Deferred().always(function() {
                delete f.elem
            }),
            f = function() {
                for (var c = Aa || qa(), c = Math.max(0, j.startTime + j.duration - c),
                    v = 1 - (c / j.duration || 0), d = 0, z = j.tweens.length; d < z; d++) j.tweens[d].run(v);
                return l.notifyWith(b, [j, v, c]), 1 > v && z ? c : (l.resolveWith(b, [j]), !1)
            },
            j = l.promise({
                elem: b,
                props: g.extend({}, c),
                opts: g.extend(!0, {
                    specialEasing: {}
                }, d),
                originalProperties: c,
                originalOptions: d,
                startTime: Aa || qa(),
                duration: d.duration,
                tweens: [],
                createTween: function(c, v) {
                    var d = g.Tween(b, j.opts, c, v, j.opts.specialEasing[c] || j.opts.easing);
                    return j.tweens.push(d), d
                },
                stop: function(c) {
                    for (var v = 0, d = c ? j.tweens.length : 0; v < d; v++) j.tweens[v].run(1);
                    return c ? l.resolveWith(b, [j, c]) : l.rejectWith(b, [j, c]), this
                }
            });
        c = j.props;
        d = j.opts.specialEasing;
        var n, m, u, y;
        for (q in c)
            if (n = g.camelCase(q), m = d[n], u = c[q], g.isArray(u) && (m = u[1], u = c[q] = u[0]), q !== n && (c[n] = u, delete c[q]), (y = g.cssHooks[n]) && "expand" in y)
                for (q in u = y.expand(u), delete c[n], u) q in c || (c[q] = u[q], d[q] = m);
            else d[n] = m;
        for (; e < p; e++)
            if (q = Ba[e].call(j, b, c, j.opts)) return q;
        var r = j;
        g.each(c, function(b, B) {
            for (var c = (ra[b] || []).concat(ra["*"]), v = 0, d = c.length; v < d && !c[v].call(r, b, B); v++);
        });
        return g.isFunction(j.opts.start) &&
            j.opts.start.call(b, j), g.fx.timer(g.extend(f, {
                anim: j,
                queue: j.opts.queue,
                elem: b
            })), j.progress(j.opts.progress).done(j.opts.done, j.opts.complete).fail(j.opts.fail).always(j.opts.always)
    }

    function R(b, c, d, g, e) {
        return new R.prototype.init(b, c, d, g, e)
    }

    function Ca(b, c) {
        var d, g = {
                height: b
            },
            e = 0;
        for (c = c ? 1 : 0; 4 > e; e += 2 - c) d = da[e], g["margin" + d] = g["padding" + d] = b;
        return c && (g.opacity = g.width = b), g
    }

    function Cb(b) {
        return g.isWindow(b) ? b : 9 === b.nodeType ? b.defaultView || b.parentWindow : !1
    }
    var Db, Da, D = b.document,
        yc = b.location,
        zc = b.navigator,
        Ac = b.jQuery,
        Bc = b.$,
        Eb = Array.prototype.push,
        Z = Array.prototype.slice,
        Fb = Array.prototype.indexOf,
        Cc = Object.prototype.toString,
        ab = Object.prototype.hasOwnProperty,
        bb = String.prototype.trim,
        g = function(b, c) {
            return new g.fn.init(b, c, Db)
        },
        Ea = /[\-+]?(?:\d*\.|)\d+(?:[eE][\-+]?\d+|)/.source,
        Dc = /\S/,
        ea = /\s+/,
        Ec = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,
        Fc = /^(?:[^#<]*(<[\w\W]+>)[^>]*$|#([\w\-]*)$)/,
        Gb = /^<(\w+)\s*\/?>(?:<\/\1>|)$/,
        Gc = /^[\],:{}\s]*$/,
        Hc = /(?:^|:|,)(?:\s*\[)+/g,
        Ic = /\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,
        Jc = /"[^"\\\r\n]*"|true|false|null|-?(?:\d\d*\.|)\d+(?:[eE][\-+]?\d+|)/g,
        Kc = /^-ms-/,
        Lc = /-([\da-z])/gi,
        Mc = function(b, c) {
            return (c + "").toUpperCase()
        },
        Fa = function() {
            D.addEventListener ? (D.removeEventListener("DOMContentLoaded", Fa, !1), g.ready()) : "complete" === D.readyState && (D.detachEvent("onreadystatechange", Fa), g.ready())
        },
        Hb = {};
    g.fn = g.prototype = {
        constructor: g,
        init: function(b, v, d) {
            var q, e;
            if (!b) return this;
            if (b.nodeType) return this.context = this[0] = b, this.length = 1, this;
            if ("string" == typeof b) {
                "<" === b.charAt(0) &&
                    ">" === b.charAt(b.length - 1) && 3 <= b.length ? q = [null, b, null] : q = Fc.exec(b);
                if (q && (q[1] || !v)) {
                    if (q[1]) return v = v instanceof g ? v[0] : v, e = v && v.nodeType ? v.ownerDocument || v : D, b = g.parseHTML(q[1], e, !0), Gb.test(q[1]) && g.isPlainObject(v) && this.attr.call(b, v, !0), g.merge(this, b);
                    if ((v = D.getElementById(q[2])) && v.parentNode) {
                        if (v.id !== q[2]) return d.find(b);
                        this.length = 1;
                        this[0] = v
                    }
                    return this.context = D, this.selector = b, this
                }
                return !v || v.jquery ? (v || d).find(b) : this.constructor(v).find(b)
            }
            return g.isFunction(b) ? d.ready(b) :
                (b.selector !== c && (this.selector = b.selector, this.context = b.context), g.makeArray(b, this))
        },
        selector: "",
        jquery: "1.8.2",
        length: 0,
        size: function() {
            return this.length
        },
        toArray: function() {
            return Z.call(this)
        },
        get: function(b) {
            return null == b ? this.toArray() : 0 > b ? this[this.length + b] : this[b]
        },
        pushStack: function(b, c, d) {
            b = g.merge(this.constructor(), b);
            return b.prevObject = this, b.context = this.context, "find" === c ? b.selector = this.selector + (this.selector ? " " : "") + d : c && (b.selector = this.selector + "." + c + "(" + d + ")"), b
        },
        each: function(b,
            c) {
            return g.each(this, b, c)
        },
        ready: function(b) {
            return g.ready.promise().done(b), this
        },
        eq: function(b) {
            return b = +b, -1 === b ? this.slice(b) : this.slice(b, b + 1)
        },
        first: function() {
            return this.eq(0)
        },
        last: function() {
            return this.eq(-1)
        },
        slice: function() {
            return this.pushStack(Z.apply(this, arguments), "slice", Z.call(arguments).join(","))
        },
        map: function(b) {
            return this.pushStack(g.map(this, function(c, d) {
                return b.call(c, d, c)
            }))
        },
        end: function() {
            return this.prevObject || this.constructor(null)
        },
        push: Eb,
        sort: [].sort,
        splice: [].splice
    };
    g.fn.init.prototype = g.fn;
    g.extend = g.fn.extend = function() {
        var b, v, d, q, e, p, l = arguments[0] || {},
            f = 1,
            j = arguments.length,
            n = !1;
        "boolean" == typeof l && (n = l, l = arguments[1] || {}, f = 2);
        "object" != typeof l && !g.isFunction(l) && (l = {});
        for (j === f && (l = this, --f); f < j; f++)
            if (null != (b = arguments[f]))
                for (v in b) d = l[v], q = b[v], l !== q && (n && q && (g.isPlainObject(q) || (e = g.isArray(q))) ? (e ? (e = !1, p = d && g.isArray(d) ? d : []) : p = d && g.isPlainObject(d) ? d : {}, l[v] = g.extend(n, p, q)) : q !== c && (l[v] = q));
        return l
    };
    g.extend({
        noConflict: function(c) {
            return b.$ ===
                g && (b.$ = Bc), c && b.jQuery === g && (b.jQuery = Ac), g
        },
        isReady: !1,
        readyWait: 1,
        holdReady: function(b) {
            b ? g.readyWait++ : g.ready(!0)
        },
        ready: function(b) {
            if (!(!0 === b ? --g.readyWait : g.isReady)) {
                if (!D.body) return setTimeout(g.ready, 1);
                g.isReady = !0;
                !0 !== b && 0 < --g.readyWait || (Da.resolveWith(D, [g]), g.fn.trigger && g(D).trigger("ready").off("ready"))
            }
        },
        isFunction: function(b) {
            return "function" === g.type(b)
        },
        isArray: Array.isArray || function(b) {
            return "array" === g.type(b)
        },
        isWindow: function(b) {
            return null != b && b == b.window
        },
        isNumeric: function(b) {
            return !isNaN(parseFloat(b)) &&
                isFinite(b)
        },
        type: function(b) {
            return null == b ? String(b) : Hb[Cc.call(b)] || "object"
        },
        isPlainObject: function(b) {
            if (!b || "object" !== g.type(b) || b.nodeType || g.isWindow(b)) return !1;
            try {
                if (b.constructor && !ab.call(b, "constructor") && !ab.call(b.constructor.prototype, "isPrototypeOf")) return !1
            } catch (v) {
                return !1
            }
            for (var d in b);
            return d === c || ab.call(b, d)
        },
        isEmptyObject: function(b) {
            for (var c in b) return !1;
            return !0
        },
        error: function(b) {
            throw Error(b);
        },
        parseHTML: function(b, c, d) {
            var q;
            return !b || "string" != typeof b ? null :
                ("boolean" == typeof c && (d = c, c = 0), c = c || D, (q = Gb.exec(b)) ? [c.createElement(q[1])] : (q = g.buildFragment([b], c, d ? null : []), g.merge([], (q.cacheable ? g.clone(q.fragment) : q.fragment).childNodes)))
        },
        parseJSON: function(c) {
            if (!c || "string" != typeof c) return null;
            c = g.trim(c);
            if (b.JSON && b.JSON.parse) return b.JSON.parse(c);
            if (Gc.test(c.replace(Ic, "@").replace(Jc, "]").replace(Hc, ""))) return (new Function("return " + c))();
            g.error("Invalid JSON: " + c)
        },
        parseXML: function(B) {
            var v, d;
            if (!B || "string" != typeof B) return null;
            try {
                b.DOMParser ?
                    (d = new DOMParser, v = d.parseFromString(B, "text/xml")) : (v = new ActiveXObject("Microsoft.XMLDOM"), v.async = "false", v.loadXML(B))
            } catch (q) {
                v = c
            }
            return (!v || !v.documentElement || v.getElementsByTagName("parsererror").length) && g.error("Invalid XML: " + B), v
        },
        noop: function() {},
        globalEval: function(c) {
            c && Dc.test(c) && (b.execScript || function(c) {
                b.eval.call(b, c)
            })(c)
        },
        camelCase: function(b) {
            return b.replace(Kc, "ms-").replace(Lc, Mc)
        },
        nodeName: function(b, c) {
            return b.nodeName && b.nodeName.toLowerCase() === c.toLowerCase()
        },
        each: function(b, v, d) {
            var q, e = 0,
                p = b.length,
                l = p === c || g.isFunction(b);
            if (d)
                if (l)
                    for (q in b) {
                        if (!1 === v.apply(b[q], d)) break
                    } else
                        for (; e < p && !1 !== v.apply(b[e++], d););
                else if (l)
                for (q in b) {
                    if (!1 === v.call(b[q], q, b[q])) break
                } else
                    for (; e < p && !1 !== v.call(b[e], e, b[e++]););
            return b
        },
        trim: bb && !bb.call("\ufeff\u00a0") ? function(b) {
            return null == b ? "" : bb.call(b)
        } : function(b) {
            return null == b ? "" : (b + "").replace(Ec, "")
        },
        makeArray: function(b, c) {
            var d, q = c || [];
            return null != b && (d = g.type(b), null == b.length || "string" === d || "function" ===
                d || "regexp" === d || g.isWindow(b) ? Eb.call(q, b) : g.merge(q, b)), q
        },
        inArray: function(b, c, d) {
            var g;
            if (c) {
                if (Fb) return Fb.call(c, b, d);
                g = c.length;
                for (d = d ? 0 > d ? Math.max(0, g + d) : d : 0; d < g; d++)
                    if (d in c && c[d] === b) return d
            }
            return -1
        },
        merge: function(b, d) {
            var g = d.length,
                q = b.length,
                e = 0;
            if ("number" == typeof g)
                for (; e < g; e++) b[q++] = d[e];
            else
                for (; d[e] !== c;) b[q++] = d[e++];
            return b.length = q, b
        },
        grep: function(b, c, d) {
            var g, e = [],
                p = 0,
                l = b.length;
            for (d = !!d; p < l; p++) g = !!c(b[p], p), d !== g && e.push(b[p]);
            return e
        },
        map: function(b, d, z) {
            var q,
                e, p = [],
                l = 0,
                f = b.length;
            if (b instanceof g || f !== c && "number" == typeof f && (0 < f && b[0] && b[f - 1] || 0 === f || g.isArray(b)))
                for (; l < f; l++) q = d(b[l], l, z), null != q && (p[p.length] = q);
            else
                for (e in b) q = d(b[e], e, z), null != q && (p[p.length] = q);
            return p.concat.apply([], p)
        },
        guid: 1,
        proxy: function(b, d) {
            var z, q, e;
            return "string" == typeof d && (z = b[d], d = b, b = z), g.isFunction(b) ? (q = Z.call(arguments, 2), e = function() {
                return b.apply(d, q.concat(Z.call(arguments)))
            }, e.guid = b.guid = b.guid || g.guid++, e) : c
        },
        access: function(b, d, z, q, e, p, l) {
            var f, j = null ==
                z,
                n = 0,
                m = b.length;
            if (z && "object" == typeof z) {
                for (n in z) g.access(b, d, n, z[n], 1, p, q);
                e = 1
            } else if (q !== c) {
                f = l === c && g.isFunction(q);
                j && (f ? (f = d, d = function(b, c, B) {
                    return f.call(g(b), B)
                }) : (d.call(b, q), d = null));
                if (d)
                    for (; n < m; n++) d(b[n], z, f ? q.call(b[n], n, d(b[n], z)) : q, l);
                e = 1
            }
            return e ? b : j ? d.call(b) : m ? d(b[0], z) : p
        },
        now: function() {
            return (new Date).getTime()
        }
    });
    g.ready.promise = function(c) {
        if (!Da)
            if (Da = g.Deferred(), "complete" === D.readyState) setTimeout(g.ready, 1);
            else if (D.addEventListener) D.addEventListener("DOMContentLoaded",
            Fa, !1), b.addEventListener("load", g.ready, !1);
        else {
            D.attachEvent("onreadystatechange", Fa);
            b.attachEvent("onload", g.ready);
            var d = !1;
            try {
                d = null == b.frameElement && D.documentElement
            } catch (z) {}
            d && d.doScroll && function I() {
                if (!g.isReady) {
                    try {
                        d.doScroll("left")
                    } catch (b) {
                        return setTimeout(I, 50)
                    }
                    g.ready()
                }
            }()
        }
        return Da.promise(c)
    };
    g.each("Boolean Number String Function Array Date RegExp Object".split(" "), function(b, c) {
        Hb["[object " + c + "]"] = c.toLowerCase()
    });
    Db = g(D);
    var Ib = {};
    g.Callbacks = function(b) {
        var d;
        if ("string" ==
            typeof b) {
            if (!(d = Ib[b])) {
                d = b;
                var z = Ib[d] = {};
                d = (g.each(d.split(ea), function(b, c) {
                    z[c] = !0
                }), z)
            }
        } else d = g.extend({}, b);
        b = d;
        var q, e, p, l, f, j, n = [],
            m = !b.once && [],
            u = function(c) {
                q = b.memory && c;
                e = !0;
                j = l || 0;
                l = 0;
                f = n.length;
                for (p = !0; n && j < f; j++)
                    if (!1 === n[j].apply(c[0], c[1]) && b.stopOnFalse) {
                        q = !1;
                        break
                    }
                p = !1;
                n && (m ? m.length && u(m.shift()) : q ? n = [] : y.disable())
            },
            y = {
                add: function() {
                    if (n) {
                        var c = n.length;
                        (function xc(c) {
                            g.each(c, function(c, d) {
                                var v = g.type(d);
                                "function" === v && (!b.unique || !y.has(d)) ? n.push(d) : d && d.length && "string" !==
                                    v && xc(d)
                            })
                        })(arguments);
                        p ? f = n.length : q && (l = c, u(q))
                    }
                    return this
                },
                remove: function() {
                    return n && g.each(arguments, function(b, c) {
                        for (var B; - 1 < (B = g.inArray(c, n, B));) n.splice(B, 1), p && (B <= f && f--, B <= j && j--)
                    }), this
                },
                has: function(b) {
                    return -1 < g.inArray(b, n)
                },
                empty: function() {
                    return n = [], this
                },
                disable: function() {
                    return n = m = q = c, this
                },
                disabled: function() {
                    return !n
                },
                lock: function() {
                    return m = c, q || y.disable(), this
                },
                locked: function() {
                    return !m
                },
                fireWith: function(b, c) {
                    return c = c || [], c = [b, c.slice ? c.slice() : c], n && (!e || m) &&
                        (p ? m.push(c) : u(c)), this
                },
                fire: function() {
                    return y.fireWith(this, arguments), this
                },
                fired: function() {
                    return !!e
                }
            };
        return y
    };
    g.extend({
        Deferred: function(b) {
            var c = [
                    ["resolve", "done", g.Callbacks("once memory"), "resolved"],
                    ["reject", "fail", g.Callbacks("once memory"), "rejected"],
                    ["notify", "progress", g.Callbacks("memory")]
                ],
                d = "pending",
                q = {
                    state: function() {
                        return d
                    },
                    always: function() {
                        return e.done(arguments).fail(arguments), this
                    },
                    then: function() {
                        var b = arguments;
                        return g.Deferred(function(B) {
                            g.each(c, function(c,
                                d) {
                                var v = d[0],
                                    z = b[c];
                                e[d[1]](g.isFunction(z) ? function() {
                                    var b = z.apply(this, arguments);
                                    b && g.isFunction(b.promise) ? b.promise().done(B.resolve).fail(B.reject).progress(B.notify) : B[v + "With"](this === e ? B : this, [b])
                                } : B[v])
                            });
                            b = null
                        }).promise()
                    },
                    promise: function(b) {
                        return null != b ? g.extend(b, q) : q
                    }
                },
                e = {};
            return q.pipe = q.then, g.each(c, function(b, B) {
                var g = B[2],
                    f = B[3];
                q[B[1]] = g.add;
                f && g.add(function() {
                    d = f
                }, c[b ^ 1][2].disable, c[2][2].lock);
                e[B[0]] = g.fire;
                e[B[0] + "With"] = g.fireWith
            }), q.promise(e), b && b.call(e, e), e
        },
        when: function(b) {
            var c = 0,
                d = Z.call(arguments),
                e = d.length,
                I = 1 !== e || b && g.isFunction(b.promise) ? e : 0,
                p = 1 === I ? b : g.Deferred(),
                l = function(b, c, B) {
                    return function(d) {
                        c[b] = this;
                        B[b] = 1 < arguments.length ? Z.call(arguments) : d;
                        B === f ? p.notifyWith(c, B) : --I || p.resolveWith(c, B)
                    }
                },
                f, j, n;
            if (1 < e) {
                f = Array(e);
                j = Array(e);
                for (n = Array(e); c < e; c++) d[c] && g.isFunction(d[c].promise) ? d[c].promise().done(l(c, n, d)).fail(p.reject).progress(l(c, j, f)) : --I
            }
            return I || p.resolveWith(n, d), p.promise()
        }
    });
    var Nc = g,
        cb, O, Ga, fa, Ha, Ia, S, ga, Ja, db,
        sa, Jb, K = D.createElement("div");
    K.setAttribute("className", "t");
    K.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>";
    Ga = K.getElementsByTagName("*");
    fa = K.getElementsByTagName("a")[0];
    fa.style.cssText = "top:1px;float:left;opacity:.5";
    if (!Ga || !Ga.length) cb = {};
    else {
        Ha = D.createElement("select");
        Ia = Ha.appendChild(D.createElement("option"));
        S = K.getElementsByTagName("input")[0];
        O = {
            leadingWhitespace: 3 === K.firstChild.nodeType,
            tbody: !K.getElementsByTagName("tbody").length,
            htmlSerialize: !!K.getElementsByTagName("link").length,
            style: /top/.test(fa.getAttribute("style")),
            hrefNormalized: "/a" === fa.getAttribute("href"),
            opacity: /^0.5/.test(fa.style.opacity),
            cssFloat: !!fa.style.cssFloat,
            checkOn: "on" === S.value,
            optSelected: Ia.selected,
            getSetAttribute: "t" !== K.className,
            enctype: !!D.createElement("form").enctype,
            html5Clone: "<:nav></:nav>" !== D.createElement("nav").cloneNode(!0).outerHTML,
            boxModel: "CSS1Compat" === D.compatMode,
            submitBubbles: !0,
            changeBubbles: !0,
            focusinBubbles: !1,
            deleteExpando: !0,
            noCloneEvent: !0,
            inlineBlockNeedsLayout: !1,
            shrinkWrapBlocks: !1,
            reliableMarginRight: !0,
            boxSizingReliable: !0,
            pixelPosition: !1
        };
        S.checked = !0;
        O.noCloneChecked = S.cloneNode(!0).checked;
        Ha.disabled = !0;
        O.optDisabled = !Ia.disabled;
        try {
            delete K.test
        } catch (Pd) {
            O.deleteExpando = !1
        }!K.addEventListener && K.attachEvent && K.fireEvent && (K.attachEvent("onclick", Jb = function() {
            O.noCloneEvent = !1
        }), K.cloneNode(!0).fireEvent("onclick"), K.detachEvent("onclick", Jb));
        S = D.createElement("input");
        S.value = "t";
        S.setAttribute("type", "radio");
        O.radioValue = "t" === S.value;
        S.setAttribute("checked",
            "checked");
        S.setAttribute("name", "t");
        K.appendChild(S);
        ga = D.createDocumentFragment();
        ga.appendChild(K.lastChild);
        O.checkClone = ga.cloneNode(!0).cloneNode(!0).lastChild.checked;
        O.appendChecked = S.checked;
        ga.removeChild(S);
        ga.appendChild(K);
        if (K.attachEvent)
            for (db in {
                submit: !0,
                change: !0,
                focusin: !0
            }) Ja = "on" + db, (sa = Ja in K) || (K.setAttribute(Ja, "return;"), sa = "function" == typeof K[Ja]), O[db + "Bubbles"] = sa;
        cb = (g(function() {
            var c, d, g, e, I = D.getElementsByTagName("body")[0];
            I && (c = D.createElement("div"), c.style.cssText =
                "visibility:hidden;border:0;width:0;height:0;position:static;top:0;margin-top:1px", I.insertBefore(c, I.firstChild), d = D.createElement("div"), c.appendChild(d), d.innerHTML = "<table><tr><td></td><td>t</td></tr></table>", g = d.getElementsByTagName("td"), g[0].style.cssText = "padding:0;margin:0;border:0;display:none", sa = 0 === g[0].offsetHeight, g[0].style.display = "", g[1].style.display = "none", O.reliableHiddenOffsets = sa && 0 === g[0].offsetHeight, d.innerHTML = "", d.style.cssText = "box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;",
                O.boxSizing = 4 === d.offsetWidth, O.doesNotIncludeMarginInBodyOffset = 1 !== I.offsetTop, b.getComputedStyle && (O.pixelPosition = "1%" !== (b.getComputedStyle(d, null) || {}).top, O.boxSizingReliable = "4px" === (b.getComputedStyle(d, null) || {
                    width: "4px"
                }).width, e = D.createElement("div"), e.style.cssText = d.style.cssText = "padding:0;margin:0;border:0;display:block;overflow:hidden;", e.style.marginRight = e.style.width = "0", d.style.width = "1px", d.appendChild(e), O.reliableMarginRight = !parseFloat((b.getComputedStyle(e, null) || {}).marginRight)),
                "undefined" != typeof d.style.zoom && (d.innerHTML = "", d.style.cssText = "padding:0;margin:0;border:0;display:block;overflow:hidden;width:1px;padding:1px;display:inline;zoom:1", O.inlineBlockNeedsLayout = 3 === d.offsetWidth, d.style.display = "block", d.style.overflow = "visible", d.innerHTML = "<div></div>", d.firstChild.style.width = "5px", O.shrinkWrapBlocks = 3 !== d.offsetWidth, c.style.zoom = 1), I.removeChild(c))
        }), ga.removeChild(K), Ga = fa = Ha = Ia = S = ga = K = null, O)
    }
    Nc.support = cb;
    var tc = /(?:\{[\s\S]*\}|\[[\s\S]*\])$/,
        sc = /([A-Z])/g;
    g.extend({
        cache: {},
        deletedIds: [],
        uuid: 0,
        expando: "jQuery" + (g.fn.jquery + Math.random()).replace(/\D/g, ""),
        noData: {
            embed: !0,
            object: "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",
            applet: !0
        },
        hasData: function(b) {
            return b = b.nodeType ? g.cache[b[g.expando]] : b[g.expando], !!b && !e(b)
        },
        data: function(b, d, z, e) {
            if (g.acceptData(b)) {
                var I, p, l = g.expando,
                    f = "string" == typeof d,
                    j = b.nodeType,
                    n = j ? g.cache : b,
                    m = j ? b[l] : b[l] && l;
                if (m && n[m] && (e || n[m].data) || !(f && z === c)) {
                    m || (j ? b[l] = m = g.deletedIds.pop() || g.guid++ : m = l);
                    n[m] || (n[m] = {},
                        j || (n[m].toJSON = g.noop));
                    if ("object" == typeof d || "function" == typeof d) e ? n[m] = g.extend(n[m], d) : n[m].data = g.extend(n[m].data, d);
                    return I = n[m], e || (I.data || (I.data = {}), I = I.data), z !== c && (I[g.camelCase(d)] = z), f ? (p = I[d], null == p && (p = I[g.camelCase(d)])) : p = I, p
                }
            }
        },
        removeData: function(b, c, d) {
            if (g.acceptData(b)) {
                var q, I, p, l = b.nodeType,
                    f = l ? g.cache : b,
                    j = l ? b[g.expando] : g.expando;
                if (f[j]) {
                    if (c && (q = d ? f[j] : f[j].data)) {
                        g.isArray(c) || (c in q ? c = [c] : (c = g.camelCase(c), c in q ? c = [c] : c = c.split(" ")));
                        I = 0;
                        for (p = c.length; I < p; I++) delete q[c[I]];
                        if (!(d ? e : g.isEmptyObject)(q)) return
                    }
                    if (d || !(delete f[j].data, !e(f[j]))) l ? g.cleanData([b], !0) : g.support.deleteExpando || f != f.window ? delete f[j] : f[j] = null
                }
            }
        },
        _data: function(b, c, d) {
            return g.data(b, c, d, !0)
        },
        acceptData: function(b) {
            var c = b.nodeName && g.noData[b.nodeName.toLowerCase()];
            return !c || !0 !== c && b.getAttribute("classid") === c
        }
    });
    g.fn.extend({
        data: function(b, v) {
            var z, e, I, p, l, f = this[0],
                j = 0,
                n = null;
            if (b === c) {
                if (this.length && (n = g.data(f), 1 === f.nodeType && !g._data(f, "parsedAttrs"))) {
                    I = f.attributes;
                    for (l = I.length; j <
                        l; j++) p = I[j].name, p.indexOf("data-") || (p = g.camelCase(p.substring(5)), d(f, p, n[p]));
                    g._data(f, "parsedAttrs", !0)
                }
                return n
            }
            return "object" == typeof b ? this.each(function() {
                g.data(this, b)
            }) : (z = b.split(".", 2), z[1] = z[1] ? "." + z[1] : "", e = z[1] + "!", g.access(this, function(v) {
                if (v === c) return n = this.triggerHandler("getData" + e, [z[0]]), n === c && f && (n = g.data(f, b), n = d(f, b, n)), n === c && z[1] ? this.data(z[0]) : n;
                z[1] = v;
                this.each(function() {
                    var c = g(this);
                    c.triggerHandler("setData" + e, z);
                    g.data(this, b, v);
                    c.triggerHandler("changeData" +
                        e, z)
                })
            }, null, v, 1 < arguments.length, null, !1))
        },
        removeData: function(b) {
            return this.each(function() {
                g.removeData(this, b)
            })
        }
    });
    g.extend({
        queue: function(b, c, d) {
            var e;
            if (b) return c = (c || "fx") + "queue", e = g._data(b, c), d && (!e || g.isArray(d) ? e = g._data(b, c, g.makeArray(d)) : e.push(d)), e || []
        },
        dequeue: function(b, c) {
            c = c || "fx";
            var d = g.queue(b, c),
                e = d.length,
                f = d.shift(),
                p = g._queueHooks(b, c),
                l = function() {
                    g.dequeue(b, c)
                };
            "inprogress" === f && (f = d.shift(), e--);
            f && ("fx" === c && d.unshift("inprogress"), delete p.stop, f.call(b, l, p));
            !e && p && p.empty.fire()
        },
        _queueHooks: function(b, c) {
            var d = c + "queueHooks";
            return g._data(b, d) || g._data(b, d, {
                empty: g.Callbacks("once memory").add(function() {
                    g.removeData(b, c + "queue", !0);
                    g.removeData(b, d, !0)
                })
            })
        }
    });
    g.fn.extend({
        queue: function(b, d) {
            var z = 2;
            return "string" != typeof b && (d = b, b = "fx", z--), arguments.length < z ? g.queue(this[0], b) : d === c ? this : this.each(function() {
                var c = g.queue(this, b, d);
                g._queueHooks(this, b);
                "fx" === b && "inprogress" !== c[0] && g.dequeue(this, b)
            })
        },
        dequeue: function(b) {
            return this.each(function() {
                g.dequeue(this,
                    b)
            })
        },
        delay: function(b, c) {
            return b = g.fx ? g.fx.speeds[b] || b : b, c = c || "fx", this.queue(c, function(c, d) {
                var v = setTimeout(c, b);
                d.stop = function() {
                    clearTimeout(v)
                }
            })
        },
        clearQueue: function(b) {
            return this.queue(b || "fx", [])
        },
        promise: function(b, d) {
            var z, e = 1,
                f = g.Deferred(),
                p = this,
                l = this.length,
                j = function() {
                    --e || f.resolveWith(p, [p])
                };
            "string" != typeof b && (d = b, b = c);
            for (b = b || "fx"; l--;)(z = g._data(p[l], b + "queueHooks")) && z.empty && (e++, z.empty.add(j));
            return j(), f.promise(d)
        }
    });
    var aa, Kb, Lb, Mb = /[\t\r\n]/g,
        Oc = /\r/g,
        Pc = /^(?:button|input)$/i,
        Qc = /^(?:button|input|object|select|textarea)$/i,
        Rc = /^a(?:rea|)$/i,
        Nb = /^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,
        Ob = g.support.getSetAttribute;
    g.fn.extend({
        attr: function(b, c) {
            return g.access(this, g.attr, b, c, 1 < arguments.length)
        },
        removeAttr: function(b) {
            return this.each(function() {
                g.removeAttr(this, b)
            })
        },
        prop: function(b, c) {
            return g.access(this, g.prop, b, c, 1 < arguments.length)
        },
        removeProp: function(b) {
            return b = g.propFix[b] ||
                b, this.each(function() {
                    try {
                        this[b] = c, delete this[b]
                    } catch (d) {}
                })
        },
        addClass: function(b) {
            var c, d, e, f, p, l, j;
            if (g.isFunction(b)) return this.each(function(c) {
                g(this).addClass(b.call(this, c, this.className))
            });
            if (b && "string" == typeof b) {
                c = b.split(ea);
                d = 0;
                for (e = this.length; d < e; d++)
                    if (f = this[d], 1 === f.nodeType)
                        if (!f.className && 1 === c.length) f.className = b;
                        else {
                            p = " " + f.className + " ";
                            l = 0;
                            for (j = c.length; l < j; l++) 0 > p.indexOf(" " + c[l] + " ") && (p += c[l] + " ");
                            f.className = g.trim(p)
                        }
            }
            return this
        },
        removeClass: function(b) {
            var d,
                z, e, f, p, l, j;
            if (g.isFunction(b)) return this.each(function(c) {
                g(this).removeClass(b.call(this, c, this.className))
            });
            if (b && "string" == typeof b || b === c) {
                d = (b || "").split(ea);
                l = 0;
                for (j = this.length; l < j; l++)
                    if (e = this[l], 1 === e.nodeType && e.className) {
                        z = (" " + e.className + " ").replace(Mb, " ");
                        f = 0;
                        for (p = d.length; f < p; f++)
                            for (; 0 <= z.indexOf(" " + d[f] + " ");) z = z.replace(" " + d[f] + " ", " ");
                        e.className = b ? g.trim(z) : ""
                    }
            }
            return this
        },
        toggleClass: function(b, c) {
            var d = typeof b,
                e = "boolean" == typeof c;
            return g.isFunction(b) ? this.each(function(d) {
                g(this).toggleClass(b.call(this,
                    d, this.className, c), c)
            }) : this.each(function() {
                if ("string" === d)
                    for (var f, p = 0, l = g(this), j = c, n = b.split(ea); f = n[p++];) j = e ? j : !l.hasClass(f), l[j ? "addClass" : "removeClass"](f);
                else if ("undefined" === d || "boolean" === d) this.className && g._data(this, "__className__", this.className), this.className = this.className || !1 === b ? "" : g._data(this, "__className__") || ""
            })
        },
        hasClass: function(b) {
            b = " " + b + " ";
            for (var c = 0, d = this.length; c < d; c++)
                if (1 === this[c].nodeType && 0 <= (" " + this[c].className + " ").replace(Mb, " ").indexOf(b)) return !0;
            return !1
        },
        val: function(b) {
            var d, z, e, f = this[0];
            if (arguments.length) return e = g.isFunction(b), this.each(function(z) {
                var l, f = g(this);
                if (1 === this.nodeType && (e ? l = b.call(this, z, f.val()) : l = b, null == l ? l = "" : "number" == typeof l ? l += "" : g.isArray(l) && (l = g.map(l, function(b) {
                    return null == b ? "" : b + ""
                })), d = g.valHooks[this.type] || g.valHooks[this.nodeName.toLowerCase()], !d || !("set" in d) || d.set(this, l, "value") === c)) this.value = l
            });
            if (f) return d = g.valHooks[f.type] || g.valHooks[f.nodeName.toLowerCase()], d && "get" in d && (z = d.get(f,
                "value")) !== c ? z : (z = f.value, "string" == typeof z ? z.replace(Oc, "") : null == z ? "" : z)
        }
    });
    g.extend({
        valHooks: {
            option: {
                get: function(b) {
                    var c = b.attributes.value;
                    return !c || c.specified ? b.value : b.text
                }
            },
            select: {
                get: function(b) {
                    var c, d, e = b.selectedIndex,
                        f = [],
                        p = b.options,
                        l = "select-one" === b.type;
                    if (0 > e) return null;
                    b = l ? e : 0;
                    for (d = l ? e + 1 : p.length; b < d; b++)
                        if (c = p[b], c.selected && (g.support.optDisabled ? !c.disabled : null === c.getAttribute("disabled")) && (!c.parentNode.disabled || !g.nodeName(c.parentNode, "optgroup"))) {
                            c = g(c).val();
                            if (l) return c;
                            f.push(c)
                        }
                    return l && !f.length && p.length ? g(p[e]).val() : f
                },
                set: function(b, c) {
                    var d = g.makeArray(c);
                    return g(b).find("option").each(function() {
                        this.selected = 0 <= g.inArray(g(this).val(), d)
                    }), d.length || (b.selectedIndex = -1), d
                }
            }
        },
        attrFn: {},
        attr: function(b, d, e, q) {
            var f, p, l = b.nodeType;
            if (b && !(3 === l || 8 === l || 2 === l)) {
                if (q && g.isFunction(g.fn[d])) return g(b)[d](e);
                if ("undefined" == typeof b.getAttribute) return g.prop(b, d, e);
                (q = 1 !== l || !g.isXMLDoc(b)) && (d = d.toLowerCase(), p = g.attrHooks[d] || (Nb.test(d) ? Kb :
                    aa));
                if (e !== c) {
                    if (null === e) {
                        g.removeAttr(b, d);
                        return
                    }
                    return p && "set" in p && q && (f = p.set(b, e, d)) !== c ? f : (b.setAttribute(d, e + ""), e)
                }
                return p && "get" in p && q && null !== (f = p.get(b, d)) ? f : (f = b.getAttribute(d), null === f ? c : f)
            }
        },
        removeAttr: function(b, c) {
            var d, e, f, p, l = 0;
            if (c && 1 === b.nodeType)
                for (e = c.split(ea); l < e.length; l++)(f = e[l]) && (d = g.propFix[f] || f, p = Nb.test(f), p || g.attr(b, f, ""), b.removeAttribute(Ob ? f : d), p && d in b && (b[d] = !1))
        },
        attrHooks: {
            type: {
                set: function(b, c) {
                    if (Pc.test(b.nodeName) && b.parentNode) g.error("type property can't be changed");
                    else if (!g.support.radioValue && "radio" === c && g.nodeName(b, "input")) {
                        var d = b.value;
                        return b.setAttribute("type", c), d && (b.value = d), c
                    }
                }
            },
            value: {
                get: function(b, c) {
                    return aa && g.nodeName(b, "button") ? aa.get(b, c) : c in b ? b.value : null
                },
                set: function(b, c, d) {
                    if (aa && g.nodeName(b, "button")) return aa.set(b, c, d);
                    b.value = c
                }
            }
        },
        propFix: {
            tabindex: "tabIndex",
            readonly: "readOnly",
            "for": "htmlFor",
            "class": "className",
            maxlength: "maxLength",
            cellspacing: "cellSpacing",
            cellpadding: "cellPadding",
            rowspan: "rowSpan",
            colspan: "colSpan",
            usemap: "useMap",
            frameborder: "frameBorder",
            contenteditable: "contentEditable"
        },
        prop: function(b, d, e) {
            var q, f, p, l = b.nodeType;
            if (b && !(3 === l || 8 === l || 2 === l)) return p = 1 !== l || !g.isXMLDoc(b), p && (d = g.propFix[d] || d, f = g.propHooks[d]), e !== c ? f && "set" in f && (q = f.set(b, e, d)) !== c ? q : b[d] = e : f && "get" in f && null !== (q = f.get(b, d)) ? q : b[d]
        },
        propHooks: {
            tabIndex: {
                get: function(b) {
                    var d = b.getAttributeNode("tabindex");
                    return d && d.specified ? parseInt(d.value, 10) : Qc.test(b.nodeName) || Rc.test(b.nodeName) && b.href ? 0 : c
                }
            }
        }
    });
    Kb = {
        get: function(b,
            d) {
            var e, q = g.prop(b, d);
            return !0 === q || "boolean" != typeof q && (e = b.getAttributeNode(d)) && !1 !== e.nodeValue ? d.toLowerCase() : c
        },
        set: function(b, c, d) {
            var e;
            return !1 === c ? g.removeAttr(b, d) : (e = g.propFix[d] || d, e in b && (b[e] = !0), b.setAttribute(d, d.toLowerCase())), d
        }
    };
    Ob || (Lb = {
        name: !0,
        id: !0,
        coords: !0
    }, aa = g.valHooks.button = {
        get: function(b, d) {
            var g;
            return g = b.getAttributeNode(d), g && (Lb[d] ? "" !== g.value : g.specified) ? g.value : c
        },
        set: function(b, c, d) {
            var g = b.getAttributeNode(d);
            return g || (g = D.createAttribute(d), b.setAttributeNode(g)),
                g.value = c + ""
        }
    }, g.each(["width", "height"], function(b, c) {
        g.attrHooks[c] = g.extend(g.attrHooks[c], {
            set: function(b, d) {
                if ("" === d) return b.setAttribute(c, "auto"), d
            }
        })
    }), g.attrHooks.contenteditable = {
        get: aa.get,
        set: function(b, c, d) {
            "" === c && (c = "false");
            aa.set(b, c, d)
        }
    });
    g.support.hrefNormalized || g.each(["href", "src", "width", "height"], function(b, d) {
        g.attrHooks[d] = g.extend(g.attrHooks[d], {
            get: function(b) {
                b = b.getAttribute(d, 2);
                return null === b ? c : b
            }
        })
    });
    g.support.style || (g.attrHooks.style = {
        get: function(b) {
            return b.style.cssText.toLowerCase() ||
                c
        },
        set: function(b, c) {
            return b.style.cssText = c + ""
        }
    });
    g.support.optSelected || (g.propHooks.selected = g.extend(g.propHooks.selected, {
        get: function(b) {
            b = b.parentNode;
            return b && (b.selectedIndex, b.parentNode && b.parentNode.selectedIndex), null
        }
    }));
    g.support.enctype || (g.propFix.enctype = "encoding");
    g.support.checkOn || g.each(["radio", "checkbox"], function() {
        g.valHooks[this] = {
            get: function(b) {
                return null === b.getAttribute("value") ? "on" : b.value
            }
        }
    });
    g.each(["radio", "checkbox"], function() {
        g.valHooks[this] = g.extend(g.valHooks[this], {
            set: function(b, c) {
                if (g.isArray(c)) return b.checked = 0 <= g.inArray(g(b).val(), c)
            }
        })
    });
    var eb = /^(?:textarea|input|select)$/i,
        Pb = /^([^\.]*|)(?:\.(.+)|)$/,
        Sc = /(?:^|\s)hover(\.\S+|)\b/,
        Tc = /^key/,
        Uc = /^(?:mouse|contextmenu)|click/,
        Qb = /^(?:focusinfocus|focusoutblur)$/,
        Rb = function(b) {
            return g.event.special.hover ? b : b.replace(Sc, "mouseenter$1 mouseleave$1")
        };
    g.event = {
        add: function(b, d, e, q, f) {
            var p, l, j, n, m, u, y, r, s;
            if (!(3 === b.nodeType || 8 === b.nodeType || !d || !e || !(p = g._data(b)))) {
                e.handler && (y = e, e = y.handler, f = y.selector);
                e.guid || (e.guid = g.guid++);
                (j = p.events) || (p.events = j = {});
                (l = p.handle) || (p.handle = l = function(b) {
                    return "undefined" != typeof g && (!b || g.event.triggered !== b.type) ? g.event.dispatch.apply(l.elem, arguments) : c
                }, l.elem = b);
                d = g.trim(Rb(d)).split(" ");
                for (p = 0; p < d.length; p++) {
                    n = Pb.exec(d[p]) || [];
                    m = n[1];
                    u = (n[2] || "").split(".").sort();
                    s = g.event.special[m] || {};
                    m = (f ? s.delegateType : s.bindType) || m;
                    s = g.event.special[m] || {};
                    n = g.extend({
                        type: m,
                        origType: n[1],
                        data: q,
                        handler: e,
                        guid: e.guid,
                        selector: f,
                        needsContext: f && g.expr.match.needsContext.test(f),
                        namespace: u.join(".")
                    }, y);
                    r = j[m];
                    if (!r && (r = j[m] = [], r.delegateCount = 0, !s.setup || !1 === s.setup.call(b, q, u, l))) b.addEventListener ? b.addEventListener(m, l, !1) : b.attachEvent && b.attachEvent("on" + m, l);
                    s.add && (s.add.call(b, n), n.handler.guid || (n.handler.guid = e.guid));
                    f ? r.splice(r.delegateCount++, 0, n) : r.push(n);
                    g.event.global[m] = !0
                }
                b = null
            }
        },
        global: {},
        remove: function(b, c, d, e, f) {
            var p, l, j, n, m, u, y, r, s, A, x = g.hasData(b) && g._data(b);
            if (x && (y = x.events)) {
                c = g.trim(Rb(c || "")).split(" ");
                for (p = 0; p < c.length; p++)
                    if (l = Pb.exec(c[p]) || [], j = n = l[1], l = l[2], j) {
                        r = g.event.special[j] || {};
                        j = (e ? r.delegateType : r.bindType) || j;
                        s = y[j] || [];
                        m = s.length;
                        l = l ? RegExp("(^|\\.)" + l.split(".").sort().join("\\.(?:.*\\.|)") + "(\\.|$)") : null;
                        for (u = 0; u < s.length; u++) A = s[u], (f || n === A.origType) && (!d || d.guid === A.guid) && (!l || l.test(A.namespace)) && (!e || e === A.selector || "**" === e && A.selector) && (s.splice(u--, 1), A.selector && s.delegateCount--, r.remove && r.remove.call(b, A));
                        0 === s.length && m !== s.length && ((!r.teardown || !1 === r.teardown.call(b, l, x.handle)) && g.removeEvent(b,
                            j, x.handle), delete y[j])
                    } else
                        for (j in y) g.event.remove(b, j + c[p], d, e, !0);
                g.isEmptyObject(y) && (delete x.handle, g.removeData(b, "events", !0))
            }
        },
        customEvent: {
            getData: !0,
            setData: !0,
            changeData: !0
        },
        trigger: function(d, v, e, q) {
            if (!e || 3 !== e.nodeType && 8 !== e.nodeType) {
                var f, p, l, j, n, m, u, y = d.type || d;
                j = [];
                if (!Qb.test(y + g.event.triggered) && (0 <= y.indexOf("!") && (y = y.slice(0, -1), f = !0), 0 <= y.indexOf(".") && (j = y.split("."), y = j.shift(), j.sort()), e && !g.event.customEvent[y] || g.event.global[y]))
                    if (d = "object" == typeof d ? d[g.expando] ?
                        d : new g.Event(y, d) : new g.Event(y), d.type = y, d.isTrigger = !0, d.exclusive = f, d.namespace = j.join("."), d.namespace_re = d.namespace ? RegExp("(^|\\.)" + j.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, j = 0 > y.indexOf(":") ? "on" + y : "", e) {
                        if (d.result = c, d.target || (d.target = e), v = null != v ? g.makeArray(v) : [], v.unshift(d), n = g.event.special[y] || {}, !(n.trigger && !1 === n.trigger.apply(e, v))) {
                            u = [
                                [e, n.bindType || y]
                            ];
                            if (!q && !n.noBubble && !g.isWindow(e)) {
                                p = n.delegateType || y;
                                f = Qb.test(p + y) ? e : e.parentNode;
                                for (l = e; f; f = f.parentNode) u.push([f, p]),
                                    l = f;
                                l === (e.ownerDocument || D) && u.push([l.defaultView || l.parentWindow || b, p])
                            }
                            for (p = 0; p < u.length && !d.isPropagationStopped(); p++) f = u[p][0], d.type = u[p][1], (m = (g._data(f, "events") || {})[d.type] && g._data(f, "handle")) && m.apply(f, v), (m = j && f[j]) && g.acceptData(f) && m.apply && !1 === m.apply(f, v) && d.preventDefault();
                            return d.type = y, !q && !d.isDefaultPrevented() && (!n._default || !1 === n._default.apply(e.ownerDocument, v)) && ("click" !== y || !g.nodeName(e, "a")) && g.acceptData(e) && j && e[y] && ("focus" !== y && "blur" !== y || 0 !== d.target.offsetWidth) &&
                                !g.isWindow(e) && (l = e[j], l && (e[j] = null), g.event.triggered = y, e[y](), g.event.triggered = c, l && (e[j] = l)), d.result
                        }
                    } else
                        for (p in e = g.cache, e) e[p].events && e[p].events[y] && g.event.trigger(d, v, e[p].handle.elem, !0)
            }
        },
        dispatch: function(d) {
            d = g.event.fix(d || b.event);
            var v, e, q, f, p, l, j = (g._data(this, "events") || {})[d.type] || [],
                n = j.delegateCount,
                m = Z.call(arguments),
                u = !d.exclusive && !d.namespace,
                y = g.event.special[d.type] || {},
                r = [];
            m[0] = d;
            d.delegateTarget = this;
            if (!(y.preDispatch && !1 === y.preDispatch.call(this, d))) {
                if (n &&
                    (!d.button || "click" !== d.type))
                    for (e = d.target; e != this; e = e.parentNode || this)
                        if (!0 !== e.disabled || "click" !== d.type) {
                            f = {};
                            p = [];
                            for (v = 0; v < n; v++) q = j[v], l = q.selector, f[l] === c && (f[l] = q.needsContext ? 0 <= g(l, this).index(e) : g.find(l, this, null, [e]).length), f[l] && p.push(q);
                            p.length && r.push({
                                elem: e,
                                matches: p
                            })
                        }
                j.length > n && r.push({
                    elem: this,
                    matches: j.slice(n)
                });
                for (v = 0; v < r.length && !d.isPropagationStopped(); v++) {
                    f = r[v];
                    d.currentTarget = f.elem;
                    for (e = 0; e < f.matches.length && !d.isImmediatePropagationStopped(); e++)
                        if (q = f.matches[e],
                            u || !d.namespace && !q.namespace || d.namespace_re && d.namespace_re.test(q.namespace)) d.data = q.data, d.handleObj = q, q = ((g.event.special[q.origType] || {}).handle || q.handler).apply(f.elem, m), q !== c && (d.result = q, !1 === q && (d.preventDefault(), d.stopPropagation()))
                }
                return y.postDispatch && y.postDispatch.call(this, d), d.result
            }
        },
        props: "attrChange attrName relatedNode srcElement altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
        fixHooks: {},
        keyHooks: {
            props: ["char", "charCode", "key", "keyCode"],
            filter: function(b, c) {
                return null == b.which && (b.which = null != c.charCode ? c.charCode : c.keyCode), b
            }
        },
        mouseHooks: {
            props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
            filter: function(b, d) {
                var g, e, f, p = d.button,
                    l = d.fromElement;
                return null == b.pageX && null != d.clientX && (g = b.target.ownerDocument || D, e = g.documentElement, f = g.body, b.pageX = d.clientX + (e && e.scrollLeft || f && f.scrollLeft || 0) - (e && e.clientLeft ||
                    f && f.clientLeft || 0), b.pageY = d.clientY + (e && e.scrollTop || f && f.scrollTop || 0) - (e && e.clientTop || f && f.clientTop || 0)), !b.relatedTarget && l && (b.relatedTarget = l === b.target ? d.toElement : l), !b.which && p !== c && (b.which = p & 1 ? 1 : p & 2 ? 3 : p & 4 ? 2 : 0), b
            }
        },
        fix: function(b) {
            if (b[g.expando]) return b;
            var c, d, e = b,
                f = g.event.fixHooks[b.type] || {},
                p = f.props ? this.props.concat(f.props) : this.props;
            b = g.Event(e);
            for (c = p.length; c;) d = p[--c], b[d] = e[d];
            return b.target || (b.target = e.srcElement || D), 3 === b.target.nodeType && (b.target = b.target.parentNode),
                b.metaKey = !!b.metaKey, f.filter ? f.filter(b, e) : b
        },
        special: {
            load: {
                noBubble: !0
            },
            focus: {
                delegateType: "focusin"
            },
            blur: {
                delegateType: "focusout"
            },
            beforeunload: {
                setup: function(b, c, d) {
                    g.isWindow(this) && (this.onbeforeunload = d)
                },
                teardown: function(b, c) {
                    this.onbeforeunload === c && (this.onbeforeunload = null)
                }
            }
        },
        simulate: function(b, c, d, e) {
            b = g.extend(new g.Event, d, {
                type: b,
                isSimulated: !0,
                originalEvent: {}
            });
            e ? g.event.trigger(b, null, c) : g.event.dispatch.call(c, b);
            b.isDefaultPrevented() && d.preventDefault()
        }
    };
    g.event.handle =
        g.event.dispatch;
    g.removeEvent = D.removeEventListener ? function(b, c, d) {
        b.removeEventListener && b.removeEventListener(c, d, !1)
    } : function(b, c, d) {
        c = "on" + c;
        b.detachEvent && ("undefined" == typeof b[c] && (b[c] = null), b.detachEvent(c, d))
    };
    g.Event = function(b, c) {
        if (this instanceof g.Event) b && b.type ? (this.originalEvent = b, this.type = b.type, this.isDefaultPrevented = b.defaultPrevented || !1 === b.returnValue || b.getPreventDefault && b.getPreventDefault() ? j : f) : this.type = b, c && g.extend(this, c), this.timeStamp = b && b.timeStamp || g.now(),
            this[g.expando] = !0;
        else return new g.Event(b, c)
    };
    g.Event.prototype = {
        preventDefault: function() {
            this.isDefaultPrevented = j;
            var b = this.originalEvent;
            b && (b.preventDefault ? b.preventDefault() : b.returnValue = !1)
        },
        stopPropagation: function() {
            this.isPropagationStopped = j;
            var b = this.originalEvent;
            b && (b.stopPropagation && b.stopPropagation(), b.cancelBubble = !0)
        },
        stopImmediatePropagation: function() {
            this.isImmediatePropagationStopped = j;
            this.stopPropagation()
        },
        isDefaultPrevented: f,
        isPropagationStopped: f,
        isImmediatePropagationStopped: f
    };
    g.each({
        mouseenter: "mouseover",
        mouseleave: "mouseout"
    }, function(b, c) {
        g.event.special[b] = {
            delegateType: c,
            bindType: c,
            handle: function(b) {
                var d, B = b.relatedTarget,
                    e = b.handleObj;
                if (!B || B !== this && !g.contains(this, B)) b.type = e.origType, d = e.handler.apply(this, arguments), b.type = c;
                return d
            }
        }
    });
    g.support.submitBubbles || (g.event.special.submit = {
        setup: function() {
            if (g.nodeName(this, "form")) return !1;
            g.event.add(this, "click._submit keypress._submit", function(b) {
                b = b.target;
                (b = g.nodeName(b, "input") || g.nodeName(b, "button") ?
                    b.form : c) && !g._data(b, "_submit_attached") && (g.event.add(b, "submit._submit", function(b) {
                    b._submit_bubble = !0
                }), g._data(b, "_submit_attached", !0))
            })
        },
        postDispatch: function(b) {
            b._submit_bubble && (delete b._submit_bubble, this.parentNode && !b.isTrigger && g.event.simulate("submit", this.parentNode, b, !0))
        },
        teardown: function() {
            if (g.nodeName(this, "form")) return !1;
            g.event.remove(this, "._submit")
        }
    });
    g.support.changeBubbles || (g.event.special.change = {
        setup: function() {
            if (eb.test(this.nodeName)) {
                if ("checkbox" === this.type ||
                    "radio" === this.type) g.event.add(this, "propertychange._change", function(b) {
                    "checked" === b.originalEvent.propertyName && (this._just_changed = !0)
                }), g.event.add(this, "click._change", function(b) {
                    this._just_changed && !b.isTrigger && (this._just_changed = !1);
                    g.event.simulate("change", this, b, !0)
                });
                return !1
            }
            g.event.add(this, "beforeactivate._change", function(b) {
                b = b.target;
                eb.test(b.nodeName) && !g._data(b, "_change_attached") && (g.event.add(b, "change._change", function(b) {
                    this.parentNode && !b.isSimulated && !b.isTrigger &&
                        g.event.simulate("change", this.parentNode, b, !0)
                }), g._data(b, "_change_attached", !0))
            })
        },
        handle: function(b) {
            var c = b.target;
            if (this !== c || b.isSimulated || b.isTrigger || "radio" !== c.type && "checkbox" !== c.type) return b.handleObj.handler.apply(this, arguments)
        },
        teardown: function() {
            return g.event.remove(this, "._change"), !eb.test(this.nodeName)
        }
    });
    g.support.focusinBubbles || g.each({
        focus: "focusin",
        blur: "focusout"
    }, function(b, c) {
        var d = 0,
            e = function(b) {
                g.event.simulate(c, b.target, g.event.fix(b), !0)
            };
        g.event.special[c] = {
            setup: function() {
                0 === d++ && D.addEventListener(b, e, !0)
            },
            teardown: function() {
                0 === --d && D.removeEventListener(b, e, !0)
            }
        }
    });
    g.fn.extend({
        on: function(b, d, e, q, j) {
            var p, l;
            if ("object" == typeof b) {
                "string" != typeof d && (e = e || d, d = c);
                for (l in b) this.on(l, d, e, b[l], j);
                return this
            }
            null == e && null == q ? (q = d, e = d = c) : null == q && ("string" == typeof d ? (q = e, e = c) : (q = e, e = d, d = c));
            if (!1 === q) q = f;
            else if (!q) return this;
            return 1 === j && (p = q, q = function(b) {
                return g().off(b), p.apply(this, arguments)
            }, q.guid = p.guid || (p.guid = g.guid++)), this.each(function() {
                g.event.add(this,
                    b, q, e, d)
            })
        },
        one: function(b, c, d, e) {
            return this.on(b, c, d, e, 1)
        },
        off: function(b, d, e) {
            var q, j;
            if (b && b.preventDefault && b.handleObj) return q = b.handleObj, g(b.delegateTarget).off(q.namespace ? q.origType + "." + q.namespace : q.origType, q.selector, q.handler), this;
            if ("object" == typeof b) {
                for (j in b) this.off(j, d, b[j]);
                return this
            }
            if (!1 === d || "function" == typeof d) e = d, d = c;
            return !1 === e && (e = f), this.each(function() {
                g.event.remove(this, b, e, d)
            })
        },
        bind: function(b, c, d) {
            return this.on(b, null, c, d)
        },
        unbind: function(b, c) {
            return this.off(b,
                null, c)
        },
        live: function(b, c, d) {
            return g(this.context).on(b, this.selector, c, d), this
        },
        die: function(b, c) {
            return g(this.context).off(b, this.selector || "**", c), this
        },
        delegate: function(b, c, d, e) {
            return this.on(c, b, d, e)
        },
        undelegate: function(b, c, d) {
            return 1 === arguments.length ? this.off(b, "**") : this.off(c, b || "**", d)
        },
        trigger: function(b, c) {
            return this.each(function() {
                g.event.trigger(b, c, this)
            })
        },
        triggerHandler: function(b, c) {
            if (this[0]) return g.event.trigger(b, c, this[0], !0)
        },
        toggle: function(b) {
            var c = arguments,
                d =
                b.guid || g.guid++,
                e = 0,
                f = function(d) {
                    var z = (g._data(this, "lastToggle" + b.guid) || 0) % e;
                    return g._data(this, "lastToggle" + b.guid, z + 1), d.preventDefault(), c[z].apply(this, arguments) || !1
                };
            for (f.guid = d; e < c.length;) c[e++].guid = d;
            return this.click(f)
        },
        hover: function(b, c) {
            return this.mouseenter(b).mouseleave(c || b)
        }
    });
    g.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),
        function(b, c) {
            g.fn[c] = function(b, d) {
                return null == d && (d = b, b = null), 0 < arguments.length ? this.on(c, null, b, d) : this.trigger(c)
            };
            Tc.test(c) && (g.event.fixHooks[c] = g.event.keyHooks);
            Uc.test(c) && (g.event.fixHooks[c] = g.event.mouseHooks)
        });
    var Vc = b,
        F = function(b, c, d, e) {
            d = d || [];
            c = c || W;
            var g, f, l, j, n = c.nodeType;
            if (!b || "string" != typeof b) return d;
            if (1 !== n && 9 !== n) return [];
            l = Ka(c);
            if (!l && !e && (g = Wc.exec(b)))
                if (j = g[1])
                    if (9 === n) {
                        f = c.getElementById(j);
                        if (!f || !f.parentNode) return d;
                        if (f.id === j) return d.push(f), d
                    } else {
                        if (c.ownerDocument &&
                            (f = c.ownerDocument.getElementById(j)) && Sb(c, f) && f.id === j) return d.push(f), d
                    } else {
                if (g[2]) return ma.apply(d, na.call(c.getElementsByTagName(b), 0)), d;
                if ((j = g[3]) && Tb && c.getElementsByClassName) return ma.apply(d, na.call(c.getElementsByClassName(j), 0)), d
            }
            return fb(b.replace(La, "$1"), c, d, e, l)
        },
        ta = function(b) {
            return function(c) {
                return "input" === c.nodeName.toLowerCase() && c.type === b
            }
        },
        Ub = function(b) {
            return function(c) {
                var d = c.nodeName.toLowerCase();
                return ("input" === d || "button" === d) && c.type === b
            }
        },
        ha = function(b) {
            return X(function(c) {
                return c = +c, X(function(d, e) {
                    for (var g, f = b([], d.length, c), l = f.length; l--;) d[g = f[l]] && (d[g] = !(e[g] = d[g]))
                })
            })
        },
        Ma = function(b, c, d) {
            if (b === c) return d;
            for (b = b.nextSibling; b;) {
                if (b === c) return -1;
                b = b.nextSibling
            }
            return 1
        },
        Oa = function(b, c) {
            var d, e, g, f, l, j, n;
            if (l = Vb[N][b]) return c ? 0 : l.slice(0);
            l = b;
            j = [];
            for (n = G.preFilter; l;) {
                if (!d || (e = Xc.exec(l))) e && (l = l.slice(e[0].length)), j.push(g = []);
                d = !1;
                if (e = Yc.exec(l)) g.push(d = new Wb(e.shift())), l = l.slice(d.length), d.type = e[0].replace(La, " ");
                for (f in G.filter)(e = Na[f].exec(l)) &&
                    (!n[f] || (e = n[f](e, W, !0))) && (g.push(d = new Wb(e.shift())), l = l.slice(d.length), d.type = f, d.matches = e);
                if (!d) break
            }
            return c ? l.length : l ? F.error(b) : Vb(b, j).slice(0)
        },
        hb = function(b, c, d) {
            var e = c.dir,
                g = d && "parentNode" === c.dir,
                f = Zc++;
            return c.first ? function(c, d, v) {
                for (; c = c[e];)
                    if (g || 1 === c.nodeType) return b(c, d, v)
            } : function(c, d, v) {
                if (v)
                    for (; c = c[e];) {
                        if ((g || 1 === c.nodeType) && b(c, d, v)) return c
                    } else
                        for (var z, j = ua + " " + f + " ", n = j + gb; c = c[e];)
                            if (g || 1 === c.nodeType) {
                                if ((z = c[N]) === n) return c.sizset;
                                if ("string" == typeof z &&
                                    0 === z.indexOf(j)) {
                                    if (c.sizset) return c
                                } else {
                                    c[N] = n;
                                    if (b(c, d, v)) return c.sizset = !0, c;
                                    c.sizset = !1
                                }
                            }
            }
        },
        ib = function(b) {
            return 1 < b.length ? function(c, d, e) {
                for (var g = b.length; g--;)
                    if (!b[g](c, d, e)) return !1;
                return !0
            } : b[0]
        },
        Pa = function(b, c, d, e, g) {
            for (var f, l = [], j = 0, n = b.length, m = null != c; j < n; j++)
                if (f = b[j])
                    if (!d || d(f, e, g)) l.push(f), m && c.push(j);
            return l
        },
        jb = function(b, c, d, e, g, f) {
            return e && !e[N] && (e = jb(e)), g && !g[N] && (g = jb(g, f)), X(function(f, p, j, n) {
                if (!f || !g) {
                    var m, u, y = [],
                        r = [],
                        s = p.length;
                    if (!(u = f)) {
                        u = c || "*";
                        var A =
                            j.nodeType ? [j] : j,
                            x = [];
                        m = 0;
                        for (var t = A.length; m < t; m++) F(u, A[m], x, f);
                        u = x
                    }
                    A = b && (f || !c) ? Pa(u, y, b, j, n) : u;
                    x = d ? g || (f ? b : s || e) ? [] : p : A;
                    d && d(A, x, j, n);
                    if (e) {
                        u = Pa(x, r);
                        e(u, [], j, n);
                        for (j = u.length; j--;)
                            if (m = u[j]) x[r[j]] = !(A[r[j]] = m)
                    }
                    if (f)
                        for (j = b && x.length; j--;) {
                            if (m = x[j]) f[y[j]] = !(p[y[j]] = m)
                        } else x = Pa(x === p ? x.splice(s, x.length) : x), g ? g(null, p, x, n) : ma.apply(p, x)
                }
            })
        },
        kb = function(b) {
            var c, d, e, g = b.length,
                f = G.relative[b[0].type];
            d = f || G.relative[" "];
            for (var l = f ? 1 : 0, j = hb(function(b) {
                return b === c
            }, d, !0), n = hb(function(b) {
                return -1 <
                    Xb.call(c, b)
            }, d, !0), m = [
                function(b, d, e) {
                    return !f && (e || d !== Qa) || ((c = d).nodeType ? j(b, d, e) : n(b, d, e))
                }
            ]; l < g; l++)
                if (d = G.relative[b[l].type]) m = [hb(ib(m), d)];
                else {
                    d = G.filter[b[l].type].apply(null, b[l].matches);
                    if (d[N]) {
                        for (e = ++l; e < g && !G.relative[b[e].type]; e++);
                        return jb(1 < l && ib(m), 1 < l && b.slice(0, l - 1).join("").replace(La, "$1"), d, l < e && kb(b.slice(l, e)), e < g && kb(b = b.slice(e)), e < g && b.join(""))
                    }
                    m.push(d)
                }
            return ib(m)
        },
        fb = function(b, c, d, e, g) {
            var f, l, j, n, m = Oa(b);
            if (!e && 1 === m.length) {
                l = m[0] = m[0].slice(0);
                if (2 < l.length &&
                    "ID" === (j = l[0]).type && 9 === c.nodeType && !g && G.relative[l[1].type]) {
                    c = G.find.ID(j.matches[0].replace(ia, ""), c, g)[0];
                    if (!c) return d;
                    b = b.slice(l.shift().length)
                }
                for (f = Na.POS.test(b) ? -1 : l.length - 1; 0 <= f; f--) {
                    j = l[f];
                    if (G.relative[n = j.type]) break;
                    if (n = G.find[n])
                        if (e = n(j.matches[0].replace(ia, ""), lb.test(l[0].type) && c.parentNode || c, g)) {
                            l.splice(f, 1);
                            b = e.length && l.join("");
                            if (!b) return ma.apply(d, na.call(e, 0)), d;
                            break
                        }
                }
            }
            return mb(b, m)(e, c, g, d, lb.test(b)), d
        },
        Yb = function() {},
        gb, nb, G, Ra, Ka, Sb, mb, ob, va, Qa, Zb = !0,
        N = ("sizcache" + Math.random()).replace(".", ""),
        Wb = String,
        W = Vc.document,
        V = W.documentElement,
        ua = 0,
        Zc = 0,
        $c = [].pop,
        ma = [].push,
        na = [].slice,
        Xb = [].indexOf || function(b) {
            for (var c = 0, d = this.length; c < d; c++)
                if (this[c] === b) return c;
            return -1
        },
        X = function(b, c) {
            return b[N] = null == c || c, b
        },
        pb = function() {
            var b = {},
                c = [];
            return X(function(d, e) {
                return c.push(d) > G.cacheLength && delete b[c.shift()], b[d] = e
            }, b)
        },
        $b = pb(),
        Vb = pb(),
        ac = pb(),
        bc = "\\[[\\x20\\t\\r\\n\\f]*((?:\\\\.|[-\\w]|[^\\x00-\\xa0])+)[\\x20\\t\\r\\n\\f]*(?:([*^$|!~]?=)[\\x20\\t\\r\\n\\f]*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|(" +
        "(?:\\\\.|[-\\w]|[^\\x00-\\xa0])+".replace("w", "w#") + ")|)|)[\\x20\\t\\r\\n\\f]*\\]",
        qb = ":((?:\\\\.|[-\\w]|[^\\x00-\\xa0])+)(?:\\((?:(['\"])((?:\\\\.|[^\\\\])*?)\\2|([^()[\\]]*|(?:(?:" + bc + ")|[^:]|\\\\.)*|.*))\\)|)",
        La = /^[\x20\t\r\n\f]+|((?:^|[^\\])(?:\\.)*)[\x20\t\r\n\f]+$/g,
        Xc = /^[\x20\t\r\n\f]*,[\x20\t\r\n\f]*/,
        Yc = /^[\x20\t\r\n\f]*([\x20\t\r\n\f>+~])[\x20\t\r\n\f]*/,
        ad = RegExp(qb),
        Wc = /^(?:#([\w\-]+)|(\w+)|\.([\w\-]+))$/,
        lb = /[\x20\t\r\n\f]*[+~]/,
        bd = /h\d/i,
        cd = /input|select|textarea|button/i,
        ia = /\\(?!\\)/g,
        Na = {
            ID: /^#((?:\\.|[-\w]|[^\x00-\xa0])+)/,
            CLASS: /^\.((?:\\.|[-\w]|[^\x00-\xa0])+)/,
            NAME: /^\[name=['"]?((?:\\.|[-\w]|[^\x00-\xa0])+)['"]?\]/,
            TAG: RegExp("^(" + "(?:\\\\.|[-\\w]|[^\\x00-\\xa0])+".replace("w", "w*") + ")"),
            ATTR: RegExp("^" + bc),
            PSEUDO: RegExp("^" + qb),
            POS: /:(even|odd|eq|gt|lt|nth|first|last)(?:\([\x20\t\r\n\f]*((?:-\d)?\d*)[\x20\t\r\n\f]*\)|)(?=[^-]|$)/i,
            CHILD: RegExp("^:(only|nth|first|last)-child(?:\\([\\x20\\t\\r\\n\\f]*(even|odd|(([+-]|)(\\d*)n|)[\\x20\\t\\r\\n\\f]*(?:([+-]|)[\\x20\\t\\r\\n\\f]*(\\d+)|))[\\x20\\t\\r\\n\\f]*\\)|)",
                "i"),
            needsContext: RegExp("^[\\x20\\t\\r\\n\\f]*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\([\\x20\\t\\r\\n\\f]*((?:-\\d)?\\d*)[\\x20\\t\\r\\n\\f]*\\)|)(?=[^-]|$)", "i")
        },
        ba = function(b) {
            var c = W.createElement("div");
            try {
                return b(c)
            } catch (d) {
                return !1
            } finally {}
        },
        dd = ba(function(b) {
            return b.appendChild(W.createComment("")), !b.getElementsByTagName("*").length
        }),
        ed = ba(function(b) {
            return b.innerHTML = "<a href='#'></a>", b.firstChild && "undefined" !== typeof b.firstChild.getAttribute && "#" === b.firstChild.getAttribute("href")
        }),
        fd = ba(function(b) {
            b.innerHTML = "<select></select>";
            b = typeof b.lastChild.getAttribute("multiple");
            return "boolean" !== b && "string" !== b
        }),
        Tb = ba(function(b) {
            return b.innerHTML = "<div class='hidden e'></div><div class='hidden'></div>", !b.getElementsByClassName || !b.getElementsByClassName("e").length ? !1 : (b.lastChild.className = "e", 2 === b.getElementsByClassName("e").length)
        }),
        gd = ba(function(b) {
            b.id = N + 0;
            b.innerHTML = "<a name='" + N + "'></a><div name='" + N + "'></div>";
            V.insertBefore(b, V.firstChild);
            var c = W.getElementsByName &&
                W.getElementsByName(N).length === 2 + W.getElementsByName(N + 0).length;
            return nb = !W.getElementById(N), V.removeChild(b), c
        });
    try {
        na.call(V.childNodes, 0)[0].nodeType
    } catch (Qd) {
        na = function(b) {
            for (var c, d = []; c = this[b]; b++) d.push(c);
            return d
        }
    }
    F.matches = function(b, c) {
        return F(b, null, null, c)
    };
    F.matchesSelector = function(b, c) {
        return 0 < F(c, null, null, [b]).length
    };
    Ra = F.getText = function(b) {
        var c, d = "",
            e = 0;
        if (c = b.nodeType)
            if (1 === c || 9 === c || 11 === c) {
                if ("string" == typeof b.textContent) return b.textContent;
                for (b = b.firstChild; b; b =
                    b.nextSibling) d += Ra(b)
            } else {
                if (3 === c || 4 === c) return b.nodeValue
            } else
            for (; c = b[e]; e++) d += Ra(c);
        return d
    };
    Ka = F.isXML = function(b) {
        return (b = b && (b.ownerDocument || b).documentElement) ? "HTML" !== b.nodeName : !1
    };
    Sb = F.contains = V.contains ? function(b, c) {
        var d = 9 === b.nodeType ? b.documentElement : b,
            e = c && c.parentNode;
        return b === e || !(!e || !(1 === e.nodeType && d.contains && d.contains(e)))
    } : V.compareDocumentPosition ? function(b, c) {
        return c && !!(b.compareDocumentPosition(c) & 16)
    } : function(b, c) {
        for (; c = c.parentNode;)
            if (c === b) return !0;
        return !1
    };
    F.attr = function(b, c) {
        var d, e = Ka(b);
        return e || (c = c.toLowerCase()), (d = G.attrHandle[c]) ? d(b) : e || fd ? b.getAttribute(c) : (d = b.getAttributeNode(c), d ? "boolean" == typeof b[c] ? b[c] ? c : null : d.specified ? d.value : null : null)
    };
    G = F.selectors = {
        cacheLength: 50,
        createPseudo: X,
        match: Na,
        attrHandle: ed ? {} : {
            href: function(b) {
                return b.getAttribute("href", 2)
            },
            type: function(b) {
                return b.getAttribute("type")
            }
        },
        find: {
            ID: nb ? function(b, c, d) {
                if ("undefined" !== typeof c.getElementById && !d) return (b = c.getElementById(b)) && b.parentNode ? [b] : []
            } : function(b, c, d) {
                if ("undefined" !== typeof c.getElementById && !d) return (c = c.getElementById(b)) ? c.id === b || "undefined" !== typeof c.getAttributeNode && c.getAttributeNode("id").value === b ? [c] : void 0 : []
            },
            TAG: dd ? function(b, c) {
                if ("undefined" !== typeof c.getElementsByTagName) return c.getElementsByTagName(b)
            } : function(b, c) {
                var d = c.getElementsByTagName(b);
                if ("*" === b) {
                    for (var e, g = [], f = 0; e = d[f]; f++) 1 === e.nodeType && g.push(e);
                    return g
                }
                return d
            },
            NAME: gd && function(b, c) {
                if ("undefined" !== typeof c.getElementsByName) return c.getElementsByName(name)
            },
            CLASS: Tb && function(b, c, d) {
                if ("undefined" !== typeof c.getElementsByClassName && !d) return c.getElementsByClassName(b)
            }
        },
        relative: {
            ">": {
                dir: "parentNode",
                first: !0
            },
            " ": {
                dir: "parentNode"
            },
            "+": {
                dir: "previousSibling",
                first: !0
            },
            "~": {
                dir: "previousSibling"
            }
        },
        preFilter: {
            ATTR: function(b) {
                return b[1] = b[1].replace(ia, ""), b[3] = (b[4] || b[5] || "").replace(ia, ""), "~=" === b[2] && (b[3] = " " + b[3] + " "), b.slice(0, 4)
            },
            CHILD: function(b) {
                return b[1] = b[1].toLowerCase(), "nth" === b[1] ? (b[2] || F.error(b[0]), b[3] = +(b[3] ? b[4] + (b[5] || 1) :
                    2 * ("even" === b[2] || "odd" === b[2])), b[4] = +(b[6] + b[7] || "odd" === b[2])) : b[2] && F.error(b[0]), b
            },
            PSEUDO: function(b) {
                var c, d;
                if (Na.CHILD.test(b[0])) return null;
                if (b[3]) b[2] = b[3];
                else if (c = b[4]) ad.test(c) && (d = Oa(c, !0)) && (d = c.indexOf(")", c.length - d) - c.length) && (c = c.slice(0, d), b[0] = b[0].slice(0, d)), b[2] = c;
                return b.slice(0, 3)
            }
        },
        filter: {
            ID: nb ? function(b) {
                return b = b.replace(ia, ""),
                    function(c) {
                        return c.getAttribute("id") === b
                    }
            } : function(b) {
                return b = b.replace(ia, ""),
                    function(c) {
                        return (c = "undefined" !== typeof c.getAttributeNode &&
                            c.getAttributeNode("id")) && c.value === b
                    }
            },
            TAG: function(b) {
                return "*" === b ? function() {
                    return !0
                } : (b = b.replace(ia, "").toLowerCase(), function(c) {
                    return c.nodeName && c.nodeName.toLowerCase() === b
                })
            },
            CLASS: function(b) {
                var c = $b[N][b];
                return c || (c = $b(b, RegExp("(^|[\\x20\\t\\r\\n\\f])" + b + "([\\x20\\t\\r\\n\\f]|$)"))),
                    function(b) {
                        return c.test(b.className || "undefined" !== typeof b.getAttribute && b.getAttribute("class") || "")
                    }
            },
            ATTR: function(b, c, d) {
                return function(e) {
                    e = F.attr(e, b);
                    return null == e ? "!=" === c : c ? (e += "", "=" ===
                        c ? e === d : "!=" === c ? e !== d : "^=" === c ? d && 0 === e.indexOf(d) : "*=" === c ? d && -1 < e.indexOf(d) : "$=" === c ? d && e.substr(e.length - d.length) === d : "~=" === c ? -1 < (" " + e + " ").indexOf(d) : "|=" === c ? e === d || e.substr(0, d.length + 1) === d + "-" : !1) : !0
                }
            },
            CHILD: function(b, c, d, e) {
                return "nth" === b ? function(b) {
                    var c, g;
                    c = b.parentNode;
                    if (1 === d && 0 === e) return !0;
                    if (c) {
                        g = 0;
                        for (c = c.firstChild; c && !(1 === c.nodeType && (g++, b === c)); c = c.nextSibling);
                    }
                    return g -= e, g === d || 0 === g % d && 0 <= g / d
                } : function(c) {
                    var d = c;
                    switch (b) {
                        case "only":
                        case "first":
                            for (; d = d.previousSibling;)
                                if (1 ===
                                    d.nodeType) return !1;
                            if ("first" === b) return !0;
                            d = c;
                        case "last":
                            for (; d = d.nextSibling;)
                                if (1 === d.nodeType) return !1;
                            return !0
                    }
                }
            },
            PSEUDO: function(b, c) {
                var d, e = G.pseudos[b] || G.setFilters[b.toLowerCase()] || F.error("unsupported pseudo: " + b);
                return e[N] ? e(c) : 1 < e.length ? (d = [b, b, "", c], G.setFilters.hasOwnProperty(b.toLowerCase()) ? X(function(b, d) {
                    for (var g, B = e(b, c), f = B.length; f--;) g = Xb.call(b, B[f]), b[g] = !(d[g] = B[f])
                }) : function(b) {
                    return e(b, 0, d)
                }) : e
            }
        },
        pseudos: {
            not: X(function(b) {
                var c = [],
                    d = [],
                    e = mb(b.replace(La, "$1"));
                return e[N] ? X(function(b, c, d, g) {
                    g = e(b, null, g, []);
                    for (var B = b.length; B--;)
                        if (d = g[B]) b[B] = !(c[B] = d)
                }) : function(b, g, B) {
                    return c[0] = b, e(c, null, B, d), !d.pop()
                }
            }),
            has: X(function(b) {
                return function(c) {
                    return 0 < F(b, c).length
                }
            }),
            contains: X(function(b) {
                return function(c) {
                    return -1 < (c.textContent || c.innerText || Ra(c)).indexOf(b)
                }
            }),
            enabled: function(b) {
                return !1 === b.disabled
            },
            disabled: function(b) {
                return !0 === b.disabled
            },
            checked: function(b) {
                var c = b.nodeName.toLowerCase();
                return "input" === c && !!b.checked || "option" ===
                    c && !!b.selected
            },
            selected: function(b) {
                return b.parentNode && b.parentNode.selectedIndex, !0 === b.selected
            },
            parent: function(b) {
                return !G.pseudos.empty(b)
            },
            empty: function(b) {
                var c;
                for (b = b.firstChild; b;) {
                    if ("@" < b.nodeName || 3 === (c = b.nodeType) || 4 === c) return !1;
                    b = b.nextSibling
                }
                return !0
            },
            header: function(b) {
                return bd.test(b.nodeName)
            },
            text: function(b) {
                var c, d;
                return "input" === b.nodeName.toLowerCase() && "text" === (c = b.type) && (null == (d = b.getAttribute("type")) || d.toLowerCase() === c)
            },
            radio: ta("radio"),
            checkbox: ta("checkbox"),
            file: ta("file"),
            password: ta("password"),
            image: ta("image"),
            submit: Ub("submit"),
            reset: Ub("reset"),
            button: function(b) {
                var c = b.nodeName.toLowerCase();
                return "input" === c && "button" === b.type || "button" === c
            },
            input: function(b) {
                return cd.test(b.nodeName)
            },
            focus: function(b) {
                var c = b.ownerDocument;
                return b === c.activeElement && (!c.hasFocus || c.hasFocus()) && (!!b.type || !!b.href)
            },
            active: function(b) {
                return b === b.ownerDocument.activeElement
            },
            first: ha(function() {
                return [0]
            }),
            last: ha(function(b, c) {
                return [c - 1]
            }),
            eq: ha(function(b,
                c, d) {
                return [0 > d ? d + c : d]
            }),
            even: ha(function(b, c) {
                for (var d = 0; d < c; d += 2) b.push(d);
                return b
            }),
            odd: ha(function(b, c) {
                for (var d = 1; d < c; d += 2) b.push(d);
                return b
            }),
            lt: ha(function(b, c, d) {
                for (c = 0 > d ? d + c : d; 0 <= --c;) b.push(c);
                return b
            }),
            gt: ha(function(b, c, d) {
                for (d = 0 > d ? d + c : d; ++d < c;) b.push(d);
                return b
            })
        }
    };
    ob = V.compareDocumentPosition ? function(b, c) {
        return b === c ? (va = !0, 0) : (!b.compareDocumentPosition || !c.compareDocumentPosition ? b.compareDocumentPosition : b.compareDocumentPosition(c) & 4) ? -1 : 1
    } : function(b, c) {
        if (b === c) return va = !0, 0;
        if (b.sourceIndex && c.sourceIndex) return b.sourceIndex - c.sourceIndex;
        var d, e, g = [],
            f = [];
        d = b.parentNode;
        e = c.parentNode;
        var l = d;
        if (d === e) return Ma(b, c);
        if (!d) return -1;
        if (!e) return 1;
        for (; l;) g.unshift(l), l = l.parentNode;
        for (l = e; l;) f.unshift(l), l = l.parentNode;
        d = g.length;
        e = f.length;
        for (l = 0; l < d && l < e; l++)
            if (g[l] !== f[l]) return Ma(g[l], f[l]);
        return l === d ? Ma(b, f[l], -1) : Ma(g[l], c, 1)
    };
    [0, 0].sort(ob);
    Zb = !va;
    F.uniqueSort = function(b) {
        var c, d = 1;
        va = Zb;
        b.sort(ob);
        if (va)
            for (; c = b[d]; d++) c === b[d - 1] && b.splice(d--, 1);
        return b
    };
    F.error = function(b) {
        throw Error("Syntax error, unrecognized expression: " + b);
    };
    mb = F.compile = function(b, c) {
        var d, e = [],
            g = [],
            f = ac[N][b];
        if (!f) {
            c || (c = Oa(b));
            for (d = c.length; d--;) f = kb(c[d]), f[N] ? e.push(f) : g.push(f);
            var l = 0 < e.length,
                j = 0 < g.length,
                n = function(b, c, d, B, f) {
                    var v, z, p = [],
                        m = 0,
                        u = "0",
                        y = b && [],
                        r = null != f,
                        s = Qa,
                        x = b || j && G.find.TAG("*", f && c.parentNode || c),
                        A = ua += null == s ? 1 : Math.E;
                    for (r && (Qa = c !== W && c, gb = n.el); null != (f = x[u]); u++) {
                        if (j && f) {
                            for (v = 0; z = g[v]; v++)
                                if (z(f, c, d)) {
                                    B.push(f);
                                    break
                                }
                            r && (ua = A, gb =
                                ++n.el)
                        }
                        l && ((f = !z && f) && m--, b && y.push(f))
                    }
                    m += u;
                    if (l && u !== m) {
                        for (v = 0; z = e[v]; v++) z(y, p, c, d);
                        if (b) {
                            if (0 < m)
                                for (; u--;)!y[u] && !p[u] && (p[u] = $c.call(B));
                            p = Pa(p)
                        }
                        ma.apply(B, p);
                        r && !b && 0 < p.length && 1 < m + e.length && F.uniqueSort(B)
                    }
                    return r && (ua = A, Qa = s), y
                };
            d = (n.el = 0, l ? X(n) : n);
            f = ac(b, d)
        }
        return f
    };
    if (W.querySelectorAll) {
        var cc, hd = fb,
            id = /'|\\/g,
            jd = /\=[\x20\t\r\n\f]*([^'"\]]*)[\x20\t\r\n\f]*\]/g,
            Y = [":focus"],
            Sa = [":active", ":focus"],
            Ta = V.matchesSelector || V.mozMatchesSelector || V.webkitMatchesSelector || V.oMatchesSelector ||
            V.msMatchesSelector;
        ba(function(b) {
            b.innerHTML = "<select><option selected=''></option></select>";
            b.querySelectorAll("[selected]").length || Y.push("\\[[\\x20\\t\\r\\n\\f]*(?:checked|disabled|ismap|multiple|readonly|selected|value)");
            b.querySelectorAll(":checked").length || Y.push(":checked")
        });
        ba(function(b) {
            b.innerHTML = "<p test=''></p>";
            b.querySelectorAll("[test^='']").length && Y.push("[*^$]=[\\x20\\t\\r\\n\\f]*(?:\"\"|'')");
            b.innerHTML = "<input type='hidden'/>";
            b.querySelectorAll(":enabled").length || Y.push(":enabled",
                ":disabled")
        });
        Y = RegExp(Y.join("|"));
        fb = function(b, c, d, e, g) {
            if (!e && !g && (!Y || !Y.test(b))) {
                var f, j, n = !0,
                    m = N;
                j = c;
                f = 9 === c.nodeType && b;
                if (1 === c.nodeType && "object" !== c.nodeName.toLowerCase()) {
                    f = Oa(b);
                    (n = c.getAttribute("id")) ? m = n.replace(id, "\\$&"): c.setAttribute("id", m);
                    m = "[id='" + m + "'] ";
                    for (j = f.length; j--;) f[j] = m + f[j].join("");
                    j = lb.test(b) && c.parentNode || c;
                    f = f.join(",")
                }
                if (f) try {
                    return ma.apply(d, na.call(j.querySelectorAll(f), 0)), d
                } catch (u) {} finally {
                    n || c.removeAttribute("id")
                }
            }
            return hd(b, c, d, e, g)
        };
        Ta &&
            (ba(function(b) {
                cc = Ta.call(b, "div");
                try {
                    Ta.call(b, "[test!='']:sizzle"), Sa.push("!=", qb)
                } catch (c) {}
            }), Sa = RegExp(Sa.join("|")), F.matchesSelector = function(b, c) {
                c = c.replace(jd, "='$1']");
                if (!Ka(b) && !Sa.test(c) && (!Y || !Y.test(c))) try {
                    var d = Ta.call(b, c);
                    if (d || cc || b.document && 11 !== b.document.nodeType) return d
                } catch (e) {}
                return 0 < F(c, null, null, [b]).length
            })
    }
    G.pseudos.nth = G.pseudos.eq;
    G.filters = Yb.prototype = G.pseudos;
    G.setFilters = new Yb;
    F.attr = g.attr;
    g.find = F;
    g.expr = F.selectors;
    g.expr[":"] = g.expr.pseudos;
    g.unique =
        F.uniqueSort;
    g.text = F.getText;
    g.isXMLDoc = F.isXML;
    g.contains = F.contains;
    var kd = /Until$/,
        ld = /^(?:parents|prev(?:Until|All))/,
        uc = /^.[^:#\[\.,]*$/,
        dc = g.expr.match.needsContext,
        md = {
            children: !0,
            contents: !0,
            next: !0,
            prev: !0
        };
    g.fn.extend({
        find: function(b) {
            var c, d, e, f, j, l, n = this;
            if ("string" != typeof b) return g(b).filter(function() {
                c = 0;
                for (d = n.length; c < d; c++)
                    if (g.contains(n[c], this)) return !0
            });
            l = this.pushStack("", "find", b);
            c = 0;
            for (d = this.length; c < d; c++)
                if (e = l.length, g.find(b, this[c], l), 0 < c)
                    for (f = e; f < l.length; f++)
                        for (j =
                            0; j < e; j++)
                            if (l[j] === l[f]) {
                                l.splice(f--, 1);
                                break
                            }
            return l
        },
        has: function(b) {
            var c, d = g(b, this),
                e = d.length;
            return this.filter(function() {
                for (c = 0; c < e; c++)
                    if (g.contains(this, d[c])) return !0
            })
        },
        not: function(b) {
            return this.pushStack(r(this, b, !1), "not", b)
        },
        filter: function(b) {
            return this.pushStack(r(this, b, !0), "filter", b)
        },
        is: function(b) {
            return !!b && ("string" == typeof b ? dc.test(b) ? 0 <= g(b, this.context).index(this[0]) : 0 < g.filter(b, this).length : 0 < this.filter(b).length)
        },
        closest: function(b, c) {
            for (var d, e = 0, f = this.length,
                j = [], l = dc.test(b) || "string" != typeof b ? g(b, c || this.context) : 0; e < f; e++)
                for (d = this[e]; d && d.ownerDocument && d !== c && 11 !== d.nodeType;) {
                    if (l ? -1 < l.index(d) : g.find.matchesSelector(d, b)) {
                        j.push(d);
                        break
                    }
                    d = d.parentNode
                }
            return j = 1 < j.length ? g.unique(j) : j, this.pushStack(j, "closest", b)
        },
        index: function(b) {
            return b ? "string" == typeof b ? g.inArray(this[0], g(b)) : g.inArray(b.jquery ? b[0] : b, this) : this[0] && this[0].parentNode ? this.prevAll().length : -1
        },
        add: function(b, c) {
            var d = "string" == typeof b ? g(b, c) : g.makeArray(b && b.nodeType ? [b] : b),
                e = g.merge(this.get(), d);
            return this.pushStack(t(d[0]) || t(e[0]) ? e : g.unique(e))
        },
        addBack: function(b) {
            return this.add(null == b ? this.prevObject : this.prevObject.filter(b))
        }
    });
    g.fn.andSelf = g.fn.addBack;
    g.each({
        parent: function(b) {
            return (b = b.parentNode) && 11 !== b.nodeType ? b : null
        },
        parents: function(b) {
            return g.dir(b, "parentNode")
        },
        parentsUntil: function(b, c, d) {
            return g.dir(b, "parentNode", d)
        },
        next: function(b) {
            return m(b, "nextSibling")
        },
        prev: function(b) {
            return m(b, "previousSibling")
        },
        nextAll: function(b) {
            return g.dir(b,
                "nextSibling")
        },
        prevAll: function(b) {
            return g.dir(b, "previousSibling")
        },
        nextUntil: function(b, c, d) {
            return g.dir(b, "nextSibling", d)
        },
        prevUntil: function(b, c, d) {
            return g.dir(b, "previousSibling", d)
        },
        siblings: function(b) {
            return g.sibling((b.parentNode || {}).firstChild, b)
        },
        children: function(b) {
            return g.sibling(b.firstChild)
        },
        contents: function(b) {
            return g.nodeName(b, "iframe") ? b.contentDocument || b.contentWindow.document : g.merge([], b.childNodes)
        }
    }, function(b, c) {
        g.fn[b] = function(d, e) {
            var f = g.map(this, c, d);
            return kd.test(b) ||
                (e = d), e && "string" == typeof e && (f = g.filter(e, f)), f = 1 < this.length && !md[b] ? g.unique(f) : f, 1 < this.length && ld.test(b) && (f = f.reverse()), this.pushStack(f, b, Z.call(arguments).join(","))
        }
    });
    g.extend({
        filter: function(b, c, d) {
            return d && (b = ":not(" + b + ")"), 1 === c.length ? g.find.matchesSelector(c[0], b) ? [c[0]] : [] : g.find.matches(b, c)
        },
        dir: function(b, d, e) {
            var f = [];
            for (b = b[d]; b && 9 !== b.nodeType && (e === c || 1 !== b.nodeType || !g(b).is(e));) 1 === b.nodeType && f.push(b), b = b[d];
            return f
        },
        sibling: function(b, c) {
            for (var d = []; b; b = b.nextSibling) 1 ===
                b.nodeType && b !== c && d.push(b);
            return d
        }
    });
    var xb = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",
        nd = / jQuery\d+="(?:null|\d+)"/g,
        rb = /^\s+/,
        ec = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,
        fc = /<([\w:]+)/,
        od = /<tbody/i,
        pd = /<|&#?\w+;/,
        qd = /<(?:script|style|link)/i,
        rd = /<(?:script|object|embed|option|style)/i,
        sb = RegExp("<(?:" + xb + ")[\\s/>]", "i"),
        yb = /^(?:checkbox|radio)$/,
        gc = /checked\s*(?:[^=]|=\s*.checked.)/i,
        sd = /\/(java|ecma)script/i,
        td = /^\s*<!(?:\[CDATA\[|\-\-)|[\]\-]{2}>\s*$/g,
        T = {
            option: [1, "<select multiple='multiple'>", "</select>"],
            legend: [1, "<fieldset>", "</fieldset>"],
            thead: [1, "<table>", "</table>"],
            tr: [2, "<table><tbody>", "</tbody></table>"],
            td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
            col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"],
            area: [1, "<map>", "</map>"],
            _default: [0, "", ""]
        },
        hc = x(D),
        tb = hc.appendChild(D.createElement("div"));
    T.optgroup =
        T.option;
    T.tbody = T.tfoot = T.colgroup = T.caption = T.thead;
    T.th = T.td;
    g.support.htmlSerialize || (T._default = [1, "X<div>", "</div>"]);
    g.fn.extend({
        text: function(b) {
            return g.access(this, function(b) {
                return b === c ? g.text(this) : this.empty().append((this[0] && this[0].ownerDocument || D).createTextNode(b))
            }, null, b, arguments.length)
        },
        wrapAll: function(b) {
            if (g.isFunction(b)) return this.each(function(c) {
                g(this).wrapAll(b.call(this, c))
            });
            if (this[0]) {
                var c = g(b, this[0].ownerDocument).eq(0).clone(!0);
                this[0].parentNode && c.insertBefore(this[0]);
                c.map(function() {
                    for (var b = this; b.firstChild && 1 === b.firstChild.nodeType;) b = b.firstChild;
                    return b
                }).append(this)
            }
            return this
        },
        wrapInner: function(b) {
            return g.isFunction(b) ? this.each(function(c) {
                g(this).wrapInner(b.call(this, c))
            }) : this.each(function() {
                var c = g(this),
                    d = c.contents();
                d.length ? d.wrapAll(b) : c.append(b)
            })
        },
        wrap: function(b) {
            var c = g.isFunction(b);
            return this.each(function(d) {
                g(this).wrapAll(c ? b.call(this, d) : b)
            })
        },
        unwrap: function() {
            return this.parent().each(function() {
                g.nodeName(this, "body") ||
                    g(this).replaceWith(this.childNodes)
            }).end()
        },
        append: function() {
            return this.domManip(arguments, !0, function(b) {
                (1 === this.nodeType || 11 === this.nodeType) && this.appendChild(b)
            })
        },
        prepend: function() {
            return this.domManip(arguments, !0, function(b) {
                (1 === this.nodeType || 11 === this.nodeType) && this.insertBefore(b, this.firstChild)
            })
        },
        before: function() {
            if (!t(this[0])) return this.domManip(arguments, !1, function(b) {
                this.parentNode.insertBefore(b, this)
            });
            if (arguments.length) {
                var b = g.clean(arguments);
                return this.pushStack(g.merge(b,
                    this), "before", this.selector)
            }
        },
        after: function() {
            if (!t(this[0])) return this.domManip(arguments, !1, function(b) {
                this.parentNode.insertBefore(b, this.nextSibling)
            });
            if (arguments.length) {
                var b = g.clean(arguments);
                return this.pushStack(g.merge(this, b), "after", this.selector)
            }
        },
        remove: function(b, c) {
            for (var d, e = 0; null != (d = this[e]); e++)
                if (!b || g.filter(b, [d]).length)!c && 1 === d.nodeType && (g.cleanData(d.getElementsByTagName("*")), g.cleanData([d])), d.parentNode && d.parentNode.removeChild(d);
            return this
        },
        empty: function() {
            for (var b,
                c = 0; null != (b = this[c]); c++)
                for (1 === b.nodeType && g.cleanData(b.getElementsByTagName("*")); b.firstChild;) b.removeChild(b.firstChild);
            return this
        },
        clone: function(b, c) {
            return b = null == b ? !1 : b, c = null == c ? b : c, this.map(function() {
                return g.clone(this, b, c)
            })
        },
        html: function(b) {
            return g.access(this, function(b) {
                var d = this[0] || {},
                    e = 0,
                    f = this.length;
                if (b === c) return 1 === d.nodeType ? d.innerHTML.replace(nd, "") : c;
                if ("string" == typeof b && !qd.test(b) && (g.support.htmlSerialize || !sb.test(b)) && (g.support.leadingWhitespace || !rb.test(b)) &&
                    !T[(fc.exec(b) || ["", ""])[1].toLowerCase()]) {
                    b = b.replace(ec, "<$1></$2>");
                    try {
                        for (; e < f; e++) d = this[e] || {}, 1 === d.nodeType && (g.cleanData(d.getElementsByTagName("*")), d.innerHTML = b);
                        d = 0
                    } catch (B) {}
                }
                d && this.empty().append(b)
            }, null, b, arguments.length)
        },
        replaceWith: function(b) {
            return t(this[0]) ? this.length ? this.pushStack(g(g.isFunction(b) ? b() : b), "replaceWith", b) : this : g.isFunction(b) ? this.each(function(c) {
                var d = g(this),
                    e = d.html();
                d.replaceWith(b.call(this, c, e))
            }) : ("string" != typeof b && (b = g(b).detach()), this.each(function() {
                var c =
                    this.nextSibling,
                    d = this.parentNode;
                g(this).remove();
                c ? g(c).before(b) : g(d).append(b)
            }))
        },
        detach: function(b) {
            return this.remove(b, !0)
        },
        domManip: function(b, d, e) {
            b = [].concat.apply([], b);
            var f, j, n, l = 0,
                m = b[0],
                u = [],
                y = this.length;
            if (!g.support.checkClone && 1 < y && "string" == typeof m && gc.test(m)) return this.each(function() {
                g(this).domManip(b, d, e)
            });
            if (g.isFunction(m)) return this.each(function(f) {
                var j = g(this);
                b[0] = m.call(this, f, d ? j.html() : c);
                j.domManip(b, d, e)
            });
            if (this[0]) {
                f = g.buildFragment(b, this, u);
                n = f.fragment;
                j = n.firstChild;
                1 === n.childNodes.length && (n = j);
                if (j) {
                    d = d && g.nodeName(j, "tr");
                    for (f = f.cacheable || y - 1; l < y; l++) e.call(d && g.nodeName(this[l], "table") ? this[l].getElementsByTagName("tbody")[0] || this[l].appendChild(this[l].ownerDocument.createElement("tbody")) : this[l], l === f ? n : g.clone(n, !0, !0))
                }
                n = j = null;
                u.length && g.each(u, function(b, c) {
                    c.src ? g.ajax ? g.ajax({
                        url: c.src,
                        type: "GET",
                        dataType: "script",
                        async: !1,
                        global: !1,
                        "throws": !0
                    }) : g.error("no ajax") : g.globalEval((c.text || c.textContent || c.innerHTML || "").replace(td,
                        ""));
                    c.parentNode && c.parentNode.removeChild(c)
                })
            }
            return this
        }
    });
    g.buildFragment = function(b, d, e) {
        var f, j, n, l = b[0];
        return d = d || D, d = !d.nodeType && d[0] || d, d = d.ownerDocument || d, 1 === b.length && "string" == typeof l && 512 > l.length && d === D && "<" === l.charAt(0) && !rd.test(l) && (g.support.checkClone || !gc.test(l)) && (g.support.html5Clone || !sb.test(l)) && (j = !0, f = g.fragments[l], n = f !== c), f || (f = d.createDocumentFragment(), g.clean(b, d, f, e), j && (g.fragments[l] = n && f)), {
            fragment: f,
            cacheable: j
        }
    };
    g.fragments = {};
    g.each({
        appendTo: "append",
        prependTo: "prepend",
        insertBefore: "before",
        insertAfter: "after",
        replaceAll: "replaceWith"
    }, function(b, c) {
        g.fn[b] = function(d) {
            var e, f = 0,
                j = [];
            d = g(d);
            var l = d.length;
            e = 1 === this.length && this[0].parentNode;
            if ((null == e || e && 11 === e.nodeType && 1 === e.childNodes.length) && 1 === l) return d[c](this[0]), this;
            for (; f < l; f++) e = (0 < f ? this.clone(!0) : this).get(), g(d[f])[c](e), j = j.concat(e);
            return this.pushStack(j, b, d.selector)
        }
    });
    g.extend({
        clone: function(b, c, d) {
            var e, f, j, l;
            g.support.html5Clone || g.isXMLDoc(b) || !sb.test("<" + b.nodeName +
                ">") ? l = b.cloneNode(!0) : (tb.innerHTML = b.outerHTML, tb.removeChild(l = tb.firstChild));
            if ((!g.support.noCloneEvent || !g.support.noCloneChecked) && (1 === b.nodeType || 11 === b.nodeType) && !g.isXMLDoc(b)) {
                s(b, l);
                e = C(b);
                f = C(l);
                for (j = 0; e[j]; ++j) f[j] && s(e[j], f[j])
            }
            if (c && (A(b, l), d)) {
                e = C(b);
                f = C(l);
                for (j = 0; e[j]; ++j) A(e[j], f[j])
            }
            return l
        },
        clean: function(b, c, d, e) {
            var f, j, l, n, m, u, y, r = c === D && hc,
                s = [];
            if (!c || "undefined" == typeof c.createDocumentFragment) c = D;
            for (f = 0; null != (l = b[f]); f++)
                if ("number" == typeof l && (l += ""), l) {
                    if ("string" ==
                        typeof l)
                        if (pd.test(l)) {
                            r = r || x(c);
                            u = c.createElement("div");
                            r.appendChild(u);
                            l = l.replace(ec, "<$1></$2>");
                            j = (fc.exec(l) || ["", ""])[1].toLowerCase();
                            n = T[j] || T._default;
                            m = n[0];
                            for (u.innerHTML = n[1] + l + n[2]; m--;) u = u.lastChild;
                            if (!g.support.tbody) {
                                m = od.test(l);
                                n = "table" === j && !m ? u.firstChild && u.firstChild.childNodes : "<table>" === n[1] && !m ? u.childNodes : [];
                                for (j = n.length - 1; 0 <= j; --j) g.nodeName(n[j], "tbody") && !n[j].childNodes.length && n[j].parentNode.removeChild(n[j])
                            }!g.support.leadingWhitespace && rb.test(l) && u.insertBefore(c.createTextNode(rb.exec(l)[0]),
                                u.firstChild);
                            l = u.childNodes;
                            u.parentNode.removeChild(u)
                        } else l = c.createTextNode(l);
                    l.nodeType ? s.push(l) : g.merge(s, l)
                }
            u && (l = u = r = null);
            if (!g.support.appendChecked)
                for (f = 0; null != (l = s[f]); f++) g.nodeName(l, "input") ? E(l) : "undefined" != typeof l.getElementsByTagName && g.grep(l.getElementsByTagName("input"), E);
            if (d) {
                b = function(b) {
                    if (!b.type || sd.test(b.type)) return e ? e.push(b.parentNode ? b.parentNode.removeChild(b) : b) : d.appendChild(b)
                };
                for (f = 0; null != (l = s[f]); f++)
                    if (!g.nodeName(l, "script") || !b(l)) d.appendChild(l),
                        "undefined" != typeof l.getElementsByTagName && (y = g.grep(g.merge([], l.getElementsByTagName("script")), b), s.splice.apply(s, [f + 1, 0].concat(y)), f += y.length)
            }
            return s
        },
        cleanData: function(b, c) {
            for (var d, e, f, j, l = 0, n = g.expando, m = g.cache, u = g.support.deleteExpando, y = g.event.special; null != (f = b[l]); l++)
                if (c || g.acceptData(f))
                    if (d = (e = f[n]) && m[e]) {
                        if (d.events)
                            for (j in d.events) y[j] ? g.event.remove(f, j) : g.removeEvent(f, j, d.handle);
                        m[e] && (delete m[e], u ? delete f[n] : f.removeAttribute ? f.removeAttribute(n) : f[n] = null, g.deletedIds.push(e))
                    }
        }
    });
    var Ua, ca;
    g.uaMatch = function(b) {
        b = b.toLowerCase();
        b = /(chrome)[ \/]([\w.]+)/.exec(b) || /(webkit)[ \/]([\w.]+)/.exec(b) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(b) || /(msie) ([\w.]+)/.exec(b) || 0 > b.indexOf("compatible") && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(b) || [];
        return {
            browser: b[1] || "",
            version: b[2] || "0"
        }
    };
    Ua = g.uaMatch(zc.userAgent);
    ca = {};
    Ua.browser && (ca[Ua.browser] = !0, ca.version = Ua.version);
    ca.chrome ? ca.webkit = !0 : ca.webkit && (ca.safari = !0);
    g.browser = ca;
    g.sub = function() {
        function b(c, d) {
            return new b.fn.init(c,
                d)
        }
        g.extend(!0, b, this);
        b.superclass = this;
        b.fn = b.prototype = this();
        b.fn.constructor = b;
        b.sub = this.sub;
        b.fn.init = function(d, e) {
            return e && e instanceof g && !(e instanceof b) && (e = b(e)), g.fn.init.call(this, d, e, c)
        };
        b.fn.init.prototype = b.fn;
        var c = b(D);
        return b
    };
    var P, ka, la, ub = /alpha\([^)]*\)/i,
        ud = /opacity=([^)]*)/,
        vd = /^(top|right|bottom|left)$/,
        wd = /^(none|table(?!-c[ea]).+)/,
        ic = /^margin/,
        vc = RegExp("^(" + Ea + ")(.*)$", "i"),
        xa = RegExp("^(" + Ea + ")(?!px)[a-z%]+$", "i"),
        xd = RegExp("^([-+])=(" + Ea + ")", "i"),
        Xa = {},
        yd = {
            position: "absolute",
            visibility: "hidden",
            display: "block"
        },
        jc = {
            letterSpacing: 0,
            fontWeight: 400
        },
        da = ["Top", "Right", "Bottom", "Left"],
        zb = ["Webkit", "O", "Moz", "ms"],
        zd = g.fn.toggle;
    g.fn.extend({
        css: function(b, d) {
            return g.access(this, function(b, d, e) {
                return e !== c ? g.style(b, d, e) : g.css(b, d)
            }, b, d, 1 < arguments.length)
        },
        show: function() {
            return y(this, !0)
        },
        hide: function() {
            return y(this)
        },
        toggle: function(b, c) {
            var d = "boolean" == typeof b;
            return g.isFunction(b) && g.isFunction(c) ? zd.apply(this, arguments) : this.each(function() {
                (d ? b : u(this)) ? g(this).show():
                    g(this).hide()
            })
        }
    });
    g.extend({
        cssHooks: {
            opacity: {
                get: function(b, c) {
                    if (c) {
                        var d = P(b, "opacity");
                        return "" === d ? "1" : d
                    }
                }
            }
        },
        cssNumber: {
            fillOpacity: !0,
            fontWeight: !0,
            lineHeight: !0,
            opacity: !0,
            orphans: !0,
            widows: !0,
            zIndex: !0,
            zoom: !0
        },
        cssProps: {
            "float": g.support.cssFloat ? "cssFloat" : "styleFloat"
        },
        style: function(b, d, e, f) {
            if (b && !(3 === b.nodeType || 8 === b.nodeType || !b.style)) {
                var j, m, l, u = g.camelCase(d),
                    y = b.style;
                d = g.cssProps[u] || (g.cssProps[u] = n(y, u));
                l = g.cssHooks[d] || g.cssHooks[u];
                if (e === c) return l && "get" in l && (j = l.get(b, !1, f)) !== c ? j : y[d];
                m = typeof e;
                "string" === m && (j = xd.exec(e)) && (e = (j[1] + 1) * j[2] + parseFloat(g.css(b, d)), m = "number");
                if (!(null == e || "number" === m && isNaN(e)))
                    if ("number" === m && !g.cssNumber[u] && (e += "px"), !l || !("set" in l) || (e = l.set(b, e, f)) !== c) try {
                        y[d] = e
                    } catch (r) {}
            }
        },
        css: function(b, d, e, f) {
            var j, m, l, u = g.camelCase(d);
            return d = g.cssProps[u] || (g.cssProps[u] = n(b.style, u)), l = g.cssHooks[d] || g.cssHooks[u], l && "get" in l && (j = l.get(b, !0, f)), j === c && (j = P(b, d)), "normal" === j && d in jc && (j = jc[d]), e || f !== c ? (m = parseFloat(j), e ||
                g.isNumeric(m) ? m || 0 : j) : j
        },
        swap: function(b, c, d) {
            var e, g = {};
            for (e in c) g[e] = b.style[e], b.style[e] = c[e];
            d = d.call(b);
            for (e in c) b.style[e] = g[e];
            return d
        }
    });
    b.getComputedStyle ? P = function(c, d) {
        var e, f, j, n, l = b.getComputedStyle(c, null),
            m = c.style;
        return l && (e = l[d], "" === e && !g.contains(c.ownerDocument, c) && (e = g.style(c, d)), xa.test(e) && ic.test(d) && (f = m.width, j = m.minWidth, n = m.maxWidth, m.minWidth = m.maxWidth = m.width = e, e = l.width, m.width = f, m.minWidth = j, m.maxWidth = n)), e
    } : D.documentElement.currentStyle && (P = function(b,
        c) {
        var d, e, g = b.currentStyle && b.currentStyle[c],
            f = b.style;
        return null == g && f && f[c] && (g = f[c]), xa.test(g) && !vd.test(c) && (d = f.left, e = b.runtimeStyle && b.runtimeStyle.left, e && (b.runtimeStyle.left = b.currentStyle.left), f.left = "fontSize" === c ? "1em" : g, g = f.pixelLeft + "px", f.left = d, e && (b.runtimeStyle.left = e)), "" === g ? "auto" : g
    });
    g.each(["height", "width"], function(b, c) {
        g.cssHooks[c] = {
            get: function(b, d, e) {
                if (d) return 0 === b.offsetWidth && wd.test(P(b, "display")) ? g.swap(b, yd, function() {
                    return L(b, c, e)
                }) : L(b, c, e)
            },
            set: function(b,
                d, e) {
                return M(b, d, e ? Q(b, c, e, g.support.boxSizing && "border-box" === g.css(b, "boxSizing")) : 0)
            }
        }
    });
    g.support.opacity || (g.cssHooks.opacity = {
        get: function(b, c) {
            return ud.test((c && b.currentStyle ? b.currentStyle.filter : b.style.filter) || "") ? 0.01 * parseFloat(RegExp.$1) + "" : c ? "1" : ""
        },
        set: function(b, c) {
            var d = b.style,
                e = b.currentStyle,
                f = g.isNumeric(c) ? "alpha(opacity=" + 100 * c + ")" : "",
                j = e && e.filter || d.filter || "";
            d.zoom = 1;
            if (!(1 <= c && "" === g.trim(j.replace(ub, "")) && d.removeAttribute && (d.removeAttribute("filter"), e && !e.filter))) d.filter =
                ub.test(j) ? j.replace(ub, f) : j + " " + f
        }
    });
    g(function() {
        g.support.reliableMarginRight || (g.cssHooks.marginRight = {
            get: function(b, c) {
                return g.swap(b, {
                    display: "inline-block"
                }, function() {
                    if (c) return P(b, "marginRight")
                })
            }
        });
        !g.support.pixelPosition && g.fn.position && g.each(["top", "left"], function(b, c) {
            g.cssHooks[c] = {
                get: function(b, d) {
                    if (d) {
                        var e = P(b, c);
                        return xa.test(e) ? g(b).position()[c] + "px" : e
                    }
                }
            }
        })
    });
    g.expr && g.expr.filters && (g.expr.filters.hidden = function(b) {
        return 0 === b.offsetWidth && 0 === b.offsetHeight || !g.support.reliableHiddenOffsets &&
            "none" === (b.style && b.style.display || P(b, "display"))
    }, g.expr.filters.visible = function(b) {
        return !g.expr.filters.hidden(b)
    });
    g.each({
        margin: "",
        padding: "",
        border: "Width"
    }, function(b, c) {
        g.cssHooks[b + c] = {
            expand: function(d) {
                var e = "string" == typeof d ? d.split(" ") : [d],
                    g = {};
                for (d = 0; 4 > d; d++) g[b + da[d] + c] = e[d] || e[d - 2] || e[0];
                return g
            }
        };
        ic.test(b) || (g.cssHooks[b + c].set = M)
    });
    var Ad = /%20/g,
        wc = /\[\]$/,
        kc = /\r?\n/g,
        Bd = /^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,
        Cd = /^(?:select|textarea)/i;
    g.fn.extend({
        serialize: function() {
            return g.param(this.serializeArray())
        },
        serializeArray: function() {
            return this.map(function() {
                return this.elements ? g.makeArray(this.elements) : this
            }).filter(function() {
                return this.name && !this.disabled && (this.checked || Cd.test(this.nodeName) || Bd.test(this.type))
            }).map(function(b, c) {
                var d = g(this).val();
                return null == d ? null : g.isArray(d) ? g.map(d, function(b) {
                    return {
                        name: c.name,
                        value: b.replace(kc, "\r\n")
                    }
                }) : {
                    name: c.name,
                    value: d.replace(kc, "\r\n")
                }
            }).get()
        }
    });
    g.param = function(b, d) {
        var e, f = [],
            j = function(b, c) {
                c = g.isFunction(c) ? c() : null == c ? "" : c;
                f[f.length] = encodeURIComponent(b) + "=" + encodeURIComponent(c)
            };
        d === c && (d = g.ajaxSettings && g.ajaxSettings.traditional);
        if (g.isArray(b) || b.jquery && !g.isPlainObject(b)) g.each(b, function() {
            j(this.name, this.value)
        });
        else
            for (e in b) ya(e, b[e], d, j);
        return f.join("&").replace(Ad, "+")
    };
    var oa, ja, Dd = /#.*$/,
        Ed = /^(.*?):[ \t]*([^\r\n]*)\r?$/mg,
        Fd = /^(?:GET|HEAD)$/,
        Gd = /^\/\//,
        lc = /\?/,
        Hd = /<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,
        Id = /([?&])_=[^&]*/,
        mc = /^([\w\+\.\-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/,
        nc = g.fn.load,
        Za = {},
        oc = {},
        pc = ["*/"] + ["*"];
    try {
        ja = yc.href
    } catch (Rd) {
        ja = D.createElement("a"), ja.href = "", ja = ja.href
    }
    oa = mc.exec(ja.toLowerCase()) || [];
    g.fn.load = function(b, d, e) {
        if ("string" != typeof b && nc) return nc.apply(this, arguments);
        if (!this.length) return this;
        var f, j, n, l = this,
            m = b.indexOf(" ");
        return 0 <= m && (f = b.slice(m, b.length), b = b.slice(0, m)), g.isFunction(d) ? (e = d, d = c) : d && "object" == typeof d && (j = "POST"), g.ajax({
            url: b,
            type: j,
            dataType: "html",
            data: d,
            complete: function(b, c) {
                e && l.each(e, n || [b.responseText, c, b])
            }
        }).done(function(b) {
            n = arguments;
            l.html(f ? g("<div>").append(b.replace(Hd, "")).find(f) : b)
        }), this
    };
    g.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "), function(b, c) {
        g.fn[c] = function(b) {
            return this.on(c, b)
        }
    });
    g.each(["get", "post"], function(b, d) {
        g[d] = function(b, e, f, j) {
            return g.isFunction(e) && (j = j || f, f = e, e = c), g.ajax({
                type: d,
                url: b,
                data: e,
                success: f,
                dataType: j
            })
        }
    });
    g.extend({
        getScript: function(b, d) {
            return g.get(b,
                c, d, "script")
        },
        getJSON: function(b, c, d) {
            return g.get(b, c, d, "json")
        },
        ajaxSetup: function(b, c) {
            return c ? Ab(b, g.ajaxSettings) : (c = b, b = g.ajaxSettings), Ab(b, c), b
        },
        ajaxSettings: {
            url: ja,
            isLocal: /^(?:about|app|app\-storage|.+\-extension|file|res|widget):$/.test(oa[1]),
            global: !0,
            type: "GET",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            processData: !0,
            async: !0,
            accepts: {
                xml: "application/xml, text/xml",
                html: "text/html",
                text: "text/plain",
                json: "application/json, text/javascript",
                "*": pc
            },
            contents: {
                xml: /xml/,
                html: /html/,
                json: /json/
            },
            responseFields: {
                xml: "responseXML",
                text: "responseText"
            },
            converters: {
                "* text": b.String,
                "text html": !0,
                "text json": g.parseJSON,
                "text xml": g.parseXML
            },
            flatOptions: {
                context: !0,
                url: !0
            }
        },
        ajaxPrefilter: J(Za),
        ajaxTransport: J(oc),
        ajax: function(b, d) {
            function e(b, d, n, u) {
                var B, p, v, r, z, E = d;
                if (2 !== Q) {
                    Q = 2;
                    m && clearTimeout(m);
                    l = c;
                    j = u || "";
                    H.readyState = 0 < b ? 4 : 0;
                    if (n) {
                        r = s;
                        u = H;
                        var D, L, J, Ya, $a = r.contents,
                            F = r.dataTypes,
                            K = r.responseFields;
                        for (L in K) L in n && (u[K[L]] = n[L]);
                        for (;
                            "*" === F[0];) F.shift(),
                            D === c && (D = r.mimeType || u.getResponseHeader("content-type"));
                        if (D)
                            for (L in $a)
                                if ($a[L] && $a[L].test(D)) {
                                    F.unshift(L);
                                    break
                                }
                        if (F[0] in n) J = F[0];
                        else {
                            for (L in n) {
                                if (!F[0] || r.converters[L + " " + F[0]]) {
                                    J = L;
                                    break
                                }
                                Ya || (Ya = L)
                            }
                            J = J || Ya
                        }
                        r = n = J ? (J !== F[0] && F.unshift(J), n[J]) : void 0
                    }
                    if (200 <= b && 300 > b || 304 === b)
                        if (s.ifModified && (z = H.getResponseHeader("Last-Modified"), z && (g.lastModified[f] = z), z = H.getResponseHeader("Etag"), z && (g.etag[f] = z)), 304 === b) E = "notmodified", B = !0;
                        else {
                            var G;
                            a: {
                                B = s;
                                p = r;
                                var U, E = B.dataTypes.slice();
                                n =
                                    E[0];
                                D = {};
                                L = 0;
                                B.dataFilter && (p = B.dataFilter(p, B.dataType));
                                if (E[1])
                                    for (G in B.converters) D[G.toLowerCase()] = B.converters[G];
                                for (; v = E[++L];)
                                    if ("*" !== v) {
                                        if ("*" !== n && n !== v) {
                                            G = D[n + " " + v] || D["* " + v];
                                            if (!G)
                                                for (U in D)
                                                    if (z = U.split(" "), z[1] === v && (G = D[n + " " + z[0]] || D["* " + z[0]])) {
                                                        !0 === G ? G = D[U] : !0 !== D[U] && (v = z[0], E.splice(L--, 0, v));
                                                        break
                                                    }
                                            if (!0 !== G)
                                                if (G && B["throws"]) p = G(p);
                                                else try {
                                                    p = G(p)
                                                } catch (wa) {
                                                    G = {
                                                        state: "parsererror",
                                                        error: G ? wa : "No conversion from " + n + " to " + v
                                                    };
                                                    break a
                                                }
                                        }
                                        n = v
                                    }
                                G = {
                                    state: "success",
                                    data: p
                                }
                            }
                            B =
                                G;
                            E = B.state;
                            p = B.data;
                            v = B.error;
                            B = !v
                        } else if (v = E, !E || b) E = "error", 0 > b && (b = 0);
                    H.status = b;
                    H.statusText = (d || E) + "";
                    B ? t.resolveWith(x, [p, E, H]) : t.rejectWith(x, [H, E, v]);
                    H.statusCode(C);
                    C = c;
                    y && A.trigger("ajax" + (B ? "Success" : "Error"), [H, s, B ? p : v]);
                    M.fireWith(x, [H, E]);
                    y && (A.trigger("ajaxComplete", [H, s]), --g.active || g.event.trigger("ajaxStop"))
                }
            }
            "object" == typeof b && (d = b, b = c);
            d = d || {};
            var f, j, n, l, m, u, y, r, s = g.ajaxSetup({}, d),
                x = s.context || s,
                A = x !== s && (x.nodeType || x instanceof g) ? g(x) : g.event,
                t = g.Deferred(),
                M = g.Callbacks("once memory"),
                C = s.statusCode || {},
                E = {},
                D = {},
                Q = 0,
                L = "canceled",
                H = {
                    readyState: 0,
                    setRequestHeader: function(b, c) {
                        if (!Q) {
                            var d = b.toLowerCase();
                            b = D[d] = D[d] || b;
                            E[b] = c
                        }
                        return this
                    },
                    getAllResponseHeaders: function() {
                        return 2 === Q ? j : null
                    },
                    getResponseHeader: function(b) {
                        var d;
                        if (2 === Q) {
                            if (!n)
                                for (n = {}; d = Ed.exec(j);) n[d[1].toLowerCase()] = d[2];
                            d = n[b.toLowerCase()]
                        }
                        return d === c ? null : d
                    },
                    overrideMimeType: function(b) {
                        return Q || (s.mimeType = b), this
                    },
                    abort: function(b) {
                        return b = b || L, l && l.abort(b), e(0, b), this
                    }
                };
            t.promise(H);
            H.success = H.done;
            H.error = H.fail;
            H.complete = M.add;
            H.statusCode = function(b) {
                if (b) {
                    var c;
                    if (2 > Q)
                        for (c in b) C[c] = [C[c], b[c]];
                    else c = b[H.status], H.always(c)
                }
                return this
            };
            s.url = ((b || s.url) + "").replace(Dd, "").replace(Gd, oa[1] + "//");
            s.dataTypes = g.trim(s.dataType || "*").toLowerCase().split(ea);
            null == s.crossDomain && (u = mc.exec(s.url.toLowerCase()) || !1, s.crossDomain = u && u.join(":") + (u[3] ? "" : "http:" === u[1] ? 80 : 443) !== oa.join(":") + (oa[3] ? "" : "http:" === oa[1] ? 80 : 443));
            s.data && s.processData && "string" != typeof s.data && (s.data = g.param(s.data,
                s.traditional));
            U(Za, s, d, H);
            if (2 === Q) return H;
            y = s.global;
            s.type = s.type.toUpperCase();
            s.hasContent = !Fd.test(s.type);
            y && 0 === g.active++ && g.event.trigger("ajaxStart");
            if (!s.hasContent && (s.data && (s.url += (lc.test(s.url) ? "&" : "?") + s.data, delete s.data), f = s.url, !1 === s.cache)) {
                u = g.now();
                var J = s.url.replace(Id, "$1_=" + u);
                s.url = J + (J === s.url ? (lc.test(s.url) ? "&" : "?") + "_=" + u : "")
            }(s.data && s.hasContent && !1 !== s.contentType || d.contentType) && H.setRequestHeader("Content-Type", s.contentType);
            s.ifModified && (f = f || s.url, g.lastModified[f] &&
                H.setRequestHeader("If-Modified-Since", g.lastModified[f]), g.etag[f] && H.setRequestHeader("If-None-Match", g.etag[f]));
            H.setRequestHeader("Accept", s.dataTypes[0] && s.accepts[s.dataTypes[0]] ? s.accepts[s.dataTypes[0]] + ("*" !== s.dataTypes[0] ? ", " + pc + "; q=0.01" : "") : s.accepts["*"]);
            for (r in s.headers) H.setRequestHeader(r, s.headers[r]);
            if (!s.beforeSend || !1 !== s.beforeSend.call(x, H, s) && 2 !== Q) {
                L = "abort";
                for (r in {
                    success: 1,
                    error: 1,
                    complete: 1
                }) H[r](s[r]);
                if (l = U(oc, s, d, H)) {
                    H.readyState = 1;
                    y && A.trigger("ajaxSend", [H,
                        s
                    ]);
                    s.async && 0 < s.timeout && (m = setTimeout(function() {
                        H.abort("timeout")
                    }, s.timeout));
                    try {
                        Q = 1, l.send(E, e)
                    } catch (F) {
                        if (2 > Q) e(-1, F);
                        else throw F;
                    }
                } else e(-1, "No Transport");
                return H
            }
            return H.abort()
        },
        active: 0,
        lastModified: {},
        etag: {}
    });
    var qc = [],
        Jd = /\?/,
        Va = /(=)\?(?=&|$)|\?\?/,
        Kd = g.now();
    g.ajaxSetup({
        jsonp: "callback",
        jsonpCallback: function() {
            var b = qc.pop() || g.expando + "_" + Kd++;
            return this[b] = !0, b
        }
    });
    g.ajaxPrefilter("json jsonp", function(d, e, f) {
        var j, n, m, l = d.data,
            u = d.url,
            y = !1 !== d.jsonp,
            s = y && Va.test(u),
            r = y &&
            !s && "string" == typeof l && !(d.contentType || "").indexOf("application/x-www-form-urlencoded") && Va.test(l);
        if ("jsonp" === d.dataTypes[0] || s || r) return j = d.jsonpCallback = g.isFunction(d.jsonpCallback) ? d.jsonpCallback() : d.jsonpCallback, n = b[j], s ? d.url = u.replace(Va, "$1" + j) : r ? d.data = l.replace(Va, "$1" + j) : y && (d.url += (Jd.test(u) ? "&" : "?") + d.jsonp + "=" + j), d.converters["script json"] = function() {
            return m || g.error(j + " was not called"), m[0]
        }, d.dataTypes[0] = "json", b[j] = function() {
            m = arguments
        }, f.always(function() {
            b[j] = n;
            d[j] &&
                (d.jsonpCallback = e.jsonpCallback, qc.push(j));
            m && g.isFunction(n) && n(m[0]);
            m = n = c
        }), "script"
    });
    g.ajaxSetup({
        accepts: {
            script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
        },
        contents: {
            script: /javascript|ecmascript/
        },
        converters: {
            "text script": function(b) {
                return g.globalEval(b), b
            }
        }
    });
    g.ajaxPrefilter("script", function(b) {
        b.cache === c && (b.cache = !1);
        b.crossDomain && (b.type = "GET", b.global = !1)
    });
    g.ajaxTransport("script", function(b) {
        if (b.crossDomain) {
            var d, e = D.head ||
                D.getElementsByTagName("head")[0] || D.documentElement;
            return {
                send: function(g, f) {
                    d = D.createElement("script");
                    d.async = "async";
                    b.scriptCharset && (d.charset = b.scriptCharset);
                    d.src = b.url;
                    d.onload = d.onreadystatechange = function(b, g) {
                        if (g || !d.readyState || /loaded|complete/.test(d.readyState)) d.onload = d.onreadystatechange = null, e && d.parentNode && e.removeChild(d), d = c, g || f(200, "success")
                    };
                    e.insertBefore(d, e.firstChild)
                },
                abort: function() {
                    d && d.onload(0, 1)
                }
            }
        }
    });
    var pa, vb = b.ActiveXObject ? function() {
            for (var b in pa) pa[b](0,
                1)
        } : !1,
        Ld = 0;
    g.ajaxSettings.xhr = b.ActiveXObject ? function() {
        var c;
        if (!(c = !this.isLocal && za())) a: {
            try {
                c = new b.ActiveXObject("Microsoft.XMLHTTP");
                break a
            } catch (d) {}
            c = void 0
        }
        return c
    } : za;
    var wb = g.ajaxSettings.xhr();
    g.extend(g.support, {
        ajax: !!wb,
        cors: !!wb && "withCredentials" in wb
    });
    g.support.ajax && g.ajaxTransport(function(d) {
        if (!d.crossDomain || g.support.cors) {
            var e;
            return {
                send: function(f, j) {
                    var n, m, l = d.xhr();
                    d.username ? l.open(d.type, d.url, d.async, d.username, d.password) : l.open(d.type, d.url, d.async);
                    if (d.xhrFields)
                        for (m in d.xhrFields) l[m] =
                            d.xhrFields[m];
                    d.mimeType && l.overrideMimeType && l.overrideMimeType(d.mimeType);
                    !d.crossDomain && !f["X-Requested-With"] && (f["X-Requested-With"] = "XMLHttpRequest");
                    try {
                        for (m in f) l.setRequestHeader(m, f[m])
                    } catch (u) {}
                    l.send(d.hasContent && d.data || null);
                    e = function(b, f) {
                        var m, u, y, p, s;
                        try {
                            if (e && (f || 4 === l.readyState))
                                if (e = c, n && (l.onreadystatechange = g.noop, vb && delete pa[n]), f) 4 !== l.readyState && l.abort();
                                else {
                                    m = l.status;
                                    y = l.getAllResponseHeaders();
                                    p = {};
                                    (s = l.responseXML) && s.documentElement && (p.xml = s);
                                    try {
                                        p.text =
                                            l.responseText
                                    } catch (r) {}
                                    try {
                                        u = l.statusText
                                    } catch (z) {
                                        u = ""
                                    }!m && d.isLocal && !d.crossDomain ? m = p.text ? 200 : 404 : 1223 === m && (m = 204)
                                }
                        } catch (x) {
                            f || j(-1, x)
                        }
                        p && j(m, u, p, y)
                    };
                    d.async ? 4 === l.readyState ? setTimeout(e, 0) : (n = ++Ld, vb && (pa || (pa = {}, g(b).unload(vb)), pa[n] = e), l.onreadystatechange = e) : e()
                },
                abort: function() {
                    e && e(0, 1)
                }
            }
        }
    });
    var Aa, Wa, Md = /^(?:toggle|show|hide)$/,
        Nd = RegExp("^(?:([-+])=|)(" + Ea + ")([a-z%]*)$", "i"),
        Od = /queueHooks$/,
        Ba = [
            function(b, c, d) {
                var e, f, j, n, m, y, s = this,
                    r = b.style,
                    x = {},
                    A = [],
                    t = b.nodeType && u(b);
                d.queue ||
                    (m = g._queueHooks(b, "fx"), null == m.unqueued && (m.unqueued = 0, y = m.empty.fire, m.empty.fire = function() {
                        m.unqueued || y()
                    }), m.unqueued++, s.always(function() {
                        s.always(function() {
                            m.unqueued--;
                            g.queue(b, "fx").length || m.empty.fire()
                        })
                    }));
                1 === b.nodeType && ("height" in c || "width" in c) && (d.overflow = [r.overflow, r.overflowX, r.overflowY], "inline" === g.css(b, "display") && "none" === g.css(b, "float") && (!g.support.inlineBlockNeedsLayout || "inline" === wa(b.nodeName) ? r.display = "inline-block" : r.zoom = 1));
                d.overflow && (r.overflow = "hidden",
                    g.support.shrinkWrapBlocks || s.done(function() {
                        r.overflow = d.overflow[0];
                        r.overflowX = d.overflow[1];
                        r.overflowY = d.overflow[2]
                    }));
                for (e in c) f = c[e], Md.exec(f) && (delete c[e], f !== (t ? "hide" : "show") && A.push(e));
                if (f = A.length) {
                    j = g._data(b, "fxshow") || g._data(b, "fxshow", {});
                    t ? g(b).show() : s.done(function() {
                        g(b).hide()
                    });
                    s.done(function() {
                        var c;
                        g.removeData(b, "fxshow", !0);
                        for (c in x) g.style(b, c, x[c])
                    });
                    for (e = 0; e < f; e++) c = A[e], n = s.createTween(c, t ? j[c] : 0), x[c] = j[c] || g.style(b, c), c in j || (j[c] = n.start, t && (n.end = n.start,
                        n.start = "width" === c || "height" === c ? 1 : 0))
                }
            }
        ],
        ra = {
            "*": [
                function(b, c) {
                    var d, e, f = this.createTween(b, c),
                        j = Nd.exec(c),
                        n = f.cur(),
                        m = +n || 0,
                        u = 1,
                        y = 20;
                    if (j) {
                        d = +j[2];
                        e = j[3] || (g.cssNumber[b] ? "" : "px");
                        if ("px" !== e && m) {
                            m = g.css(f.elem, b, !0) || d || 1;
                            do u = u || ".5", m /= u, g.style(f.elem, b, m + e); while (u !== (u = f.cur() / n) && 1 !== u && --y)
                        }
                        f.unit = e;
                        f.start = m;
                        f.end = j[1] ? m + (j[1] + 1) * d : d
                    }
                    return f
                }
            ]
        };
    g.Animation = g.extend(Bb, {
        tweener: function(b, c) {
            g.isFunction(b) ? (c = b, b = ["*"]) : b = b.split(" ");
            for (var d, e = 0, f = b.length; e < f; e++) d = b[e], ra[d] = ra[d] || [], ra[d].unshift(c)
        },
        prefilter: function(b, c) {
            c ? Ba.unshift(b) : Ba.push(b)
        }
    });
    g.Tween = R;
    R.prototype = {
        constructor: R,
        init: function(b, c, d, e, f, j) {
            this.elem = b;
            this.prop = d;
            this.easing = f || "swing";
            this.options = c;
            this.start = this.now = this.cur();
            this.end = e;
            this.unit = j || (g.cssNumber[d] ? "" : "px")
        },
        cur: function() {
            var b = R.propHooks[this.prop];
            return b && b.get ? b.get(this) : R.propHooks._default.get(this)
        },
        run: function(b) {
            var c, d = R.propHooks[this.prop];
            return this.options.duration ? this.pos = c = g.easing[this.easing](b, this.options.duration *
                b, 0, 1, this.options.duration) : this.pos = c = b, this.now = (this.end - this.start) * c + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), d && d.set ? d.set(this) : R.propHooks._default.set(this), this
        }
    };
    R.prototype.init.prototype = R.prototype;
    R.propHooks = {
        _default: {
            get: function(b) {
                var c;
                return null == b.elem[b.prop] || b.elem.style && null != b.elem.style[b.prop] ? (c = g.css(b.elem, b.prop, !1, ""), !c || "auto" === c ? 0 : c) : b.elem[b.prop]
            },
            set: function(b) {
                g.fx.step[b.prop] ? g.fx.step[b.prop](b) : b.elem.style &&
                    (null != b.elem.style[g.cssProps[b.prop]] || g.cssHooks[b.prop]) ? g.style(b.elem, b.prop, b.now + b.unit) : b.elem[b.prop] = b.now
            }
        }
    };
    R.propHooks.scrollTop = R.propHooks.scrollLeft = {
        set: function(b) {
            b.elem.nodeType && b.elem.parentNode && (b.elem[b.prop] = b.now)
        }
    };
    g.each(["toggle", "show", "hide"], function(b, c) {
        var d = g.fn[c];
        g.fn[c] = function(e, f, j) {
            return null == e || "boolean" == typeof e || !b && g.isFunction(e) && g.isFunction(f) ? d.apply(this, arguments) : this.animate(Ca(c, !0), e, f, j)
        }
    });
    g.fn.extend({
        fadeTo: function(b, c, d, e) {
            return this.filter(u).css("opacity",
                0).show().end().animate({
                opacity: c
            }, b, d, e)
        },
        animate: function(b, c, d, e) {
            var f = g.isEmptyObject(b),
                j = g.speed(c, d, e);
            c = function() {
                var c = Bb(this, g.extend({}, b), j);
                f && c.stop(!0)
            };
            return f || !1 === j.queue ? this.each(c) : this.queue(j.queue, c)
        },
        stop: function(b, d, e) {
            var f = function(b) {
                var c = b.stop;
                delete b.stop;
                c(e)
            };
            return "string" != typeof b && (e = d, d = b, b = c), d && !1 !== b && this.queue(b || "fx", []), this.each(function() {
                var c = !0,
                    d = null != b && b + "queueHooks",
                    j = g.timers,
                    n = g._data(this);
                if (d) n[d] && n[d].stop && f(n[d]);
                else
                    for (d in n) n[d] &&
                        n[d].stop && Od.test(d) && f(n[d]);
                for (d = j.length; d--;) j[d].elem === this && (null == b || j[d].queue === b) && (j[d].anim.stop(e), c = !1, j.splice(d, 1));
                (c || !e) && g.dequeue(this, b)
            })
        }
    });
    g.each({
        slideDown: Ca("show"),
        slideUp: Ca("hide"),
        slideToggle: Ca("toggle"),
        fadeIn: {
            opacity: "show"
        },
        fadeOut: {
            opacity: "hide"
        },
        fadeToggle: {
            opacity: "toggle"
        }
    }, function(b, c) {
        g.fn[b] = function(b, d, e) {
            return this.animate(c, b, d, e)
        }
    });
    g.speed = function(b, c, d) {
        var e = b && "object" == typeof b ? g.extend({}, b) : {
            complete: d || !d && c || g.isFunction(b) && b,
            duration: b,
            easing: d && c || c && !g.isFunction(c) && c
        };
        e.duration = g.fx.off ? 0 : "number" == typeof e.duration ? e.duration : e.duration in g.fx.speeds ? g.fx.speeds[e.duration] : g.fx.speeds._default;
        if (null == e.queue || !0 === e.queue) e.queue = "fx";
        return e.old = e.complete, e.complete = function() {
            g.isFunction(e.old) && e.old.call(this);
            e.queue && g.dequeue(this, e.queue)
        }, e
    };
    g.easing = {
        linear: function(b) {
            return b
        },
        swing: function(b) {
            return 0.5 - Math.cos(b * Math.PI) / 2
        }
    };
    g.timers = [];
    g.fx = R.prototype.init;
    g.fx.tick = function() {
        for (var b, c = g.timers,
            d = 0; d < c.length; d++) b = c[d], !b() && c[d] === b && c.splice(d--, 1);
        c.length || g.fx.stop()
    };
    g.fx.timer = function(b) {
        b() && g.timers.push(b) && !Wa && (Wa = setInterval(g.fx.tick, g.fx.interval))
    };
    g.fx.interval = 13;
    g.fx.stop = function() {
        clearInterval(Wa);
        Wa = null
    };
    g.fx.speeds = {
        slow: 600,
        fast: 200,
        _default: 400
    };
    g.fx.step = {};
    g.expr && g.expr.filters && (g.expr.filters.animated = function(b) {
        return g.grep(g.timers, function(c) {
            return b === c.elem
        }).length
    });
    var rc = /^(?:body|html)$/i;
    g.fn.offset = function(b) {
        if (arguments.length) return b ===
            c ? this : this.each(function(c) {
                g.offset.setOffset(this, b, c)
            });
        var d, e, f, j, n, m, u, y = {
                top: 0,
                left: 0
            },
            s = this[0],
            r = s && s.ownerDocument;
        if (r) return (e = r.body) === s ? g.offset.bodyOffset(s) : (d = r.documentElement, g.contains(d, s) ? ("undefined" != typeof s.getBoundingClientRect && (y = s.getBoundingClientRect()), f = Cb(r), j = d.clientTop || e.clientTop || 0, n = d.clientLeft || e.clientLeft || 0, m = f.pageYOffset || d.scrollTop, u = f.pageXOffset || d.scrollLeft, {
            top: y.top + m - j,
            left: y.left + u - n
        }) : y)
    };
    g.offset = {
        bodyOffset: function(b) {
            var c = b.offsetTop,
                d = b.offsetLeft;
            return g.support.doesNotIncludeMarginInBodyOffset && (c += parseFloat(g.css(b, "marginTop")) || 0, d += parseFloat(g.css(b, "marginLeft")) || 0), {
                top: c,
                left: d
            }
        },
        setOffset: function(b, c, d) {
            var e = g.css(b, "position");
            "static" === e && (b.style.position = "relative");
            var f = g(b),
                j = f.offset(),
                n = g.css(b, "top"),
                m = g.css(b, "left"),
                u = {},
                y = {},
                s, r;
            ("absolute" === e || "fixed" === e) && -1 < g.inArray("auto", [n, m]) ? (y = f.position(), s = y.top, r = y.left) : (s = parseFloat(n) || 0, r = parseFloat(m) || 0);
            g.isFunction(c) && (c = c.call(b, d, j));
            null !=
                c.top && (u.top = c.top - j.top + s);
            null != c.left && (u.left = c.left - j.left + r);
            "using" in c ? c.using.call(b, u) : f.css(u)
        }
    };
    g.fn.extend({
        position: function() {
            if (this[0]) {
                var b = this[0],
                    c = this.offsetParent(),
                    d = this.offset(),
                    e = rc.test(c[0].nodeName) ? {
                        top: 0,
                        left: 0
                    } : c.offset();
                return d.top -= parseFloat(g.css(b, "marginTop")) || 0, d.left -= parseFloat(g.css(b, "marginLeft")) || 0, e.top += parseFloat(g.css(c[0], "borderTopWidth")) || 0, e.left += parseFloat(g.css(c[0], "borderLeftWidth")) || 0, {
                    top: d.top - e.top,
                    left: d.left - e.left
                }
            }
        },
        offsetParent: function() {
            return this.map(function() {
                for (var b =
                    this.offsetParent || D.body; b && !rc.test(b.nodeName) && "static" === g.css(b, "position");) b = b.offsetParent;
                return b || D.body
            })
        }
    });
    g.each({
        scrollLeft: "pageXOffset",
        scrollTop: "pageYOffset"
    }, function(b, d) {
        var e = /Y/.test(d);
        g.fn[b] = function(f) {
            return g.access(this, function(b, f, j) {
                var n = Cb(b);
                if (j === c) return n ? d in n ? n[d] : n.document.documentElement[f] : b[f];
                n ? n.scrollTo(e ? g(n).scrollLeft() : j, e ? j : g(n).scrollTop()) : b[f] = j
            }, b, f, arguments.length, null)
        }
    });
    g.each({
        Height: "height",
        Width: "width"
    }, function(b, d) {
        g.each({
            padding: "inner" +
                b,
            content: d,
            "": "outer" + b
        }, function(e, f) {
            g.fn[f] = function(f, j) {
                var n = arguments.length && (e || "boolean" != typeof f),
                    m = e || (!0 === f || !0 === j ? "margin" : "border");
                return g.access(this, function(d, e, f) {
                    var j;
                    return g.isWindow(d) ? d.document.documentElement["client" + b] : 9 === d.nodeType ? (j = d.documentElement, Math.max(d.body["scroll" + b], j["scroll" + b], d.body["offset" + b], j["offset" + b], j["client" + b])) : f === c ? g.css(d, e, f, m) : g.style(d, e, f, m)
                }, d, n ? f : c, n, null)
            }
        })
    });
    b.jQuery = b.$ = g;
    "function" == typeof define && define.amd && define.amd.jQuery &&
        define("jquery", [], function() {
            return g
        })
})(window);

function getInternetExplorerVersion() {
    var b = -1;
    "Microsoft Internet Explorer" == navigator.appName && null != /MSIE ([0-9]{1,}[.0-9]{0,})/.exec(navigator.userAgent) && (b = parseFloat(RegExp.$1));
    return b
}
var ie = getInternetExplorerVersion();

function getQueryVariable(b) {
    for (var c = window.location.search.substring(1).split("&"), d = 0; d < c.length; d++) {
        var e = c[d].split("=");
        if (decodeURIComponent(e[0]) == b) return decodeURIComponent(e[1])
    }
}
this.jukebox = {};
jukebox.Player = function(b, c) {
    this.id = ++jukebox.__jukeboxId;
    this.origin = c || null;
    this.settings = {};
    for (var d in this.defaults) this.settings[d] = this.defaults[d];
    if ("[object Object]" === Object.prototype.toString.call(b))
        for (var e in b) this.settings[e] = b[e];
    "[object Function]" === Object.prototype.toString.call(jukebox.Manager) && (jukebox.Manager = new jukebox.Manager);
    this.resource = this.isPlaying = null;
    this.resource = "[object Object]" === Object.prototype.toString.call(jukebox.Manager) ? jukebox.Manager.getPlayableResource(this.settings.resources) :
        this.settings.resources[0] || null;
    if (null === this.resource) throw "Your browser can't playback the given resources - or you have missed to include jukebox.Manager";
    this.__init();
    return this
};
jukebox.__jukeboxId = 0;
jukebox.Player.prototype = {
    defaults: {
        resources: [],
        autoplay: !1,
        spritemap: {},
        flashMediaElement: "./swf/FlashMediaElement.swf",
        timeout: 1E3
    },
    __addToManager: function() {
        !0 !== this.__wasAddedToManager && (jukebox.Manager.add(this), this.__wasAddedToManager = !0)
    },
    __init: function() {
        var b = this,
            c = this.settings,
            d = {},
            e;
        jukebox.Manager && void 0 !== jukebox.Manager.features && (d = jukebox.Manager.features);
        if (!0 === d.html5audio) {
            this.context = new Audio;
            this.context.src = this.resource;
            if (null === this.origin) {
                var f = function(c) {
                    b.__addToManager(c)
                };
                this.context.addEventListener("canplaythrough", f, !0);
                window.setTimeout(function() {
                    b.context.removeEventListener("canplaythrough", f, !0);
                    f("timeout")
                }, c.timeout)
            }
            this.context.autobuffer = !0;
            this.context.preload = !0;
            for (e in this.HTML5API) this[e] = this.HTML5API[e];
            1 < d.channels ? !0 === c.autoplay ? this.context.autoplay = !0 : void 0 !== c.spritemap[c.autoplay] && this.play(c.autoplay) : 1 === d.channels && void 0 !== c.spritemap[c.autoplay] && (this.backgroundMusic = c.spritemap[c.autoplay], this.backgroundMusic.started = Date.now ?
                Date.now() : +new Date, this.play(c.autoplay));
            1 == d.channels && !0 !== c.canPlayBackground && (window.addEventListener("pagehide", function() {
                null !== b.isPlaying && (b.pause(), b.__wasAutoPaused = !0)
            }), window.addEventListener("pageshow", function() {
                b.__wasAutoPaused && (b.resume(), delete b._wasAutoPaused)
            }))
        } else if (!0 === d.flashaudio) {
            for (e in this.FLASHAPI) this[e] = this.FLASHAPI[e];
            d = ["id=jukebox-flashstream-" + this.id, "autoplay=" + c.autoplay, "file=" + window.encodeURIComponent(this.resource)];
            this.__initFlashContext(d);
            !0 === c.autoplay ? this.play(0) : c.spritemap[c.autoplay] && this.play(c.autoplay)
        } else throw "Your Browser does not support Flash Audio or HTML5 Audio.";
    },
    __initFlashContext: function(b) {
        var c, d = this.settings.flashMediaElement,
            e, f = {
                flashvars: b.join("&"),
                quality: "high",
                bgcolor: "#000000",
                wmode: "transparent",
                allowscriptaccess: "always",
                allowfullscreen: "true"
            };
        if (navigator.userAgent.match(/MSIE/)) {
            c = document.createElement("div");
            document.getElementsByTagName("body")[0].appendChild(c);
            var j = document.createElement("object");
            j.id = "jukebox-flashstream-" + this.id;
            j.setAttribute("type", "application/x-shockwave-flash");
            j.setAttribute("classid", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000");
            j.setAttribute("width", "0");
            j.setAttribute("height", "0");
            f.movie = d + "?x=" + (Date.now ? Date.now() : +new Date);
            f.flashvars = b.join("&amp;");
            for (e in f) b = document.createElement("param"), b.setAttribute("name", e), b.setAttribute("value", f[e]), j.appendChild(b);
            c.outerHTML = j.outerHTML;
            this.context = document.getElementById("jukebox-flashstream-" + this.id)
        } else {
            c =
                document.createElement("embed");
            c.id = "jukebox-flashstream-" + this.id;
            c.setAttribute("type", "application/x-shockwave-flash");
            c.setAttribute("width", "100");
            c.setAttribute("height", "100");
            f.play = !1;
            f.loop = !1;
            f.src = d + "?x=" + (Date.now ? Date.now() : +new Date);
            for (e in f) c.setAttribute(e, f[e]);
            document.getElementsByTagName("body")[0].appendChild(c);
            this.context = c
        }
    },
    backgroundHackForiOS: function() {
        if (void 0 !== this.backgroundMusic) {
            var b = Date.now ? Date.now() : +new Date;
            void 0 === this.backgroundMusic.started ? (this.backgroundMusic.started =
                b, this.setCurrentTime(this.backgroundMusic.start)) : (this.backgroundMusic.lastPointer = (b - this.backgroundMusic.started) / 1E3 % (this.backgroundMusic.end - this.backgroundMusic.start) + this.backgroundMusic.start, this.play(this.backgroundMusic.lastPointer))
        }
    },
    play: function(b, c) {
        if (null !== this.isPlaying && !0 !== c) void 0 !== jukebox.Manager && jukebox.Manager.addToQueue(b, this.id);
        else {
            var d = this.settings.spritemap,
                e;
            if (void 0 !== d[b]) e = d[b].start;
            else if ("number" === typeof b) {
                e = b;
                for (var f in d)
                    if (e >= d[f].start && e <=
                        d[f].end) {
                        b = f;
                        break
                    }
            }
            void 0 !== e && "[object Object]" === Object.prototype.toString.call(d[b]) && (this.isPlaying = this.settings.spritemap[b], this.context.play && this.context.play(), this.wasReady = this.setCurrentTime(e))
        }
    },
    stop: function() {
        this.__lastPosition = 0;
        this.isPlaying = null;
        this.backgroundMusic ? this.backgroundHackForiOS() : this.context.pause();
        return !0
    },
    pause: function() {
        this.isPlaying = null;
        this.__lastPosition = this.getCurrentTime();
        this.context.pause();
        return this.__lastPosition
    },
    resume: function(b) {
        b = "number" ===
            typeof b ? b : this.__lastPosition;
        if (null !== b) return this.play(b), this.__lastPosition = null, !0;
        this.context.play();
        return !1
    },
    HTML5API: {
        getVolume: function() {
            return this.context.volume || 1
        },
        setVolume: function(b) {
            this.context.volume = b;
            return 1E-4 > Math.abs(this.context.volume - b) ? !0 : !1
        },
        getCurrentTime: function() {
            return this.context.currentTime || 0
        },
        setCurrentTime: function(b) {
            try {
                return this.context.currentTime = b, !0
            } catch (c) {
                return !1
            }
        }
    },
    FLASHAPI: {
        getVolume: function() {
            return this.context && "function" === typeof this.context.getVolume ?
                this.context.getVolume() : 1
        },
        setVolume: function(b) {
            return this.context && "function" === typeof this.context.setVolume ? (this.context.setVolume(b), !0) : !1
        },
        getCurrentTime: function() {
            return this.context && "function" === typeof this.context.getCurrentTime ? this.context.getCurrentTime() : 0
        },
        setCurrentTime: function(b) {
            return this.context && "function" === typeof this.context.setCurrentTime ? this.context.setCurrentTime(b) : !1
        }
    }
};
if (void 0 === this.jukebox) throw "jukebox.Manager requires jukebox.Player (Player.js) to run properly.";
jukebox.Manager = function(b) {
    this.features = {};
    this.codecs = {};
    this.__players = {};
    this.__playersLength = 0;
    this.__clones = {};
    this.__queue = [];
    this.settings = {};
    for (var c in this.defaults) this.settings[c] = this.defaults[c];
    if ("[object Object]" === Object.prototype.toString.call(b))
        for (var d in b) this.settings[d] = b[d];
    this.__detectFeatures();
    jukebox.Manager.__initialized = !1 === this.settings.useGameLoop ? window.setInterval(function() {
        jukebox.Manager.loop()
    }, 20) : !0
};
jukebox.Manager.prototype = {
    defaults: {
        useFlash: !1,
        useGameLoop: !1
    },
    __detectFeatures: function() {
        var b = window.Audio && new Audio;
        if (b && b.canPlayType && !1 === this.settings.useFlash) {
            for (var c = [{
                    e: "3gp",
                    m: ["audio/3gpp", "audio/amr"]
                }, {
                    e: "aac",
                    m: ["audio/aac", "audio/aacp"]
                }, {
                    e: "amr",
                    m: ["audio/amr", "audio/3gpp"]
                }, {
                    e: "caf",
                    m: ["audio/IMA-ADPCM", "audio/x-adpcm", 'audio/x-aiff; codecs="IMA-ADPCM, ADPCM"']
                }, {
                    e: "m4a",
                    m: 'audio/mp4{audio/mp4; codecs="mp4a.40.2,avc1.42E01E"{audio/mpeg4{audio/mpeg4-generic{audio/mp4a-latm{audio/MP4A-LATM{audio/x-m4a'.split("{")
                }, {
                    e: "mp3",
                    m: ["audio/mp3", "audio/mpeg", 'audio/mpeg; codecs="mp3"', "audio/MPA", "audio/mpa-robust"]
                }, {
                    e: "mpga",
                    m: ["audio/MPA", "audio/mpa-robust", "audio/mpeg", "video/mpeg"]
                }, {
                    e: "mp4",
                    m: ["audio/mp4", "video/mp4"]
                }, {
                    e: "ogg",
                    m: ["application/ogg", "audio/ogg", 'audio/ogg; codecs="theora, vorbis"', "video/ogg", 'video/ogg; codecs="theora, vorbis"']
                }, {
                    e: "wav",
                    m: ["audio/wave", "audio/wav", 'audio/wav; codecs="1"', "audio/x-wav", "audio/x-pn-wav"]
                }, {
                    e: "webm",
                    m: ["audio/webm", 'audio/webm; codecs="vorbis"', "video/webm"]
                }],
                d, e, f = 0, j = c.length; f < j; f++)
                if (e = c[f].e, c[f].m.length && "object" === typeof c[f].m)
                    for (var t = 0, m = c[f].m.length; t < m; t++)
                        if (d = c[f].m[t], "" !== b.canPlayType(d)) {
                            this.codecs[e] = d;
                            break
                        } else this.codecs[e] || (this.codecs[e] = !1);
            this.features.html5audio = !(!this.codecs.mp3 && !this.codecs.ogg && !this.codecs.webm && !this.codecs.wav);
            this.features.channels = 8;
            b.volume = 0.1337;
            this.features.volume = !!(1E-4 > Math.abs(b.volume - 0.1337));
            navigator.userAgent.match(/iPhone|iPod|iPad/i) && (this.features.channels = 1)
        }
        this.features.flashaudio = !!navigator.mimeTypes["application/x-shockwave-flash"] || !!navigator.plugins["Shockwave Flash"] || !1;
        if (window.ActiveXObject) try {
            new ActiveXObject("ShockwaveFlash.ShockwaveFlash.10"), this.features.flashaudio = !0
        } catch (r) {}!0 === this.settings.useFlash && (this.features.flashaudio = !0);
        !0 === this.features.flashaudio && !this.features.html5audio && (this.codecs.mp3 = "audio/mp3", this.codecs.mpga = "audio/mpeg", this.codecs.mp4 = "audio/mp4", this.codecs.m4a = "audio/mp4", this.codecs["3gp"] = "audio/3gpp", this.codecs.amr = "audio/amr",
            this.features.volume = !0, this.features.channels = 1)
    },
    __getPlayerById: function(b) {
        return this.__players && void 0 !== this.__players[b] ? this.__players[b] : null
    },
    __getClone: function(b, c) {
        for (var d in this.__clones) {
            var e = this.__clones[d];
            if (null === e.isPlaying && e.origin === b) return e
        }
        if ("[object Object]" === Object.prototype.toString.call(c)) {
            d = {};
            for (var f in c) d[f] = c[f];
            d.autoplay = !1;
            f = new jukebox.Player(d, b);
            f.isClone = !0;
            f.wasReady = !1;
            return this.__clones[f.id] = f
        }
        return null
    },
    loop: function() {
        if (0 !== this.__playersLength)
            if (this.__queue.length &&
                this.__playersLength < this.features.channels) {
                var b = this.__queue[0],
                    c = this.__getPlayerById(b.origin);
                if (null !== c) {
                    var d = this.__getClone(b.origin, c.settings);
                    null !== d && (!0 === this.features.volume && (c = this.__players[b.origin]) && d.setVolume(c.getVolume()), this.add(d), d.play(b.pointer, !0))
                }
                this.__queue.splice(0, 1)
            } else
                for (d in this.__queue.length && 1 === this.features.channels && (b = this.__queue[0], c = this.__getPlayerById(b.origin), null !== c && c.play(b.pointer, !0), this.__queue.splice(0, 1)), this.__players) b = this.__players[d],
                    c = b.getCurrentTime() || 0, b.isPlaying && !1 === b.wasReady ? b.wasReady = b.setCurrentTime(b.isPlaying.start) : b.isPlaying && !0 === b.wasReady ? c > b.isPlaying.end && (!0 === b.isPlaying.loop ? b.play(b.isPlaying.start, !0) : b.stop()) : b.isClone && null === b.isPlaying ? this.remove(b) : void 0 !== b.backgroundMusic && null === b.isPlaying && c > b.backgroundMusic.end && b.backgroundHackForiOS()
    },
    getPlayableResource: function(b) {
        "[object Array]" !== Object.prototype.toString.call(b) && (b = [b]);
        for (var c = 0, d = b.length; c < d; c++) {
            var e = b[c],
                f = e.match(/\.([^\.]*)$/)[1];
            if (f && this.codecs[f]) return e
        }
        return null
    },
    add: function(b) {
        return b instanceof jukebox.Player && void 0 === this.__players[b.id] ? (this.__playersLength++, this.__players[b.id] = b, !0) : !1
    },
    remove: function(b) {
        return b instanceof jukebox.Player && void 0 !== this.__players[b.id] ? (this.__playersLength--, delete this.__players[b.id], !0) : !1
    },
    addToQueue: function(b, c) {
        return ("string" === typeof b || "number" === typeof b) && void 0 !== this.__players[c] ? (this.__queue.push({
            pointer: b,
            origin: c
        }), !0) : !1
    }
};
(function() {
    var b = {},
        c = null,
        d = !0,
        e = !1;
    try {
        "undefined" !== typeof AudioContext ? c = new AudioContext : "undefined" !== typeof webkitAudioContext ? c = new webkitAudioContext : d = !1
    } catch (f) {
        d = !1
    }
    if (!d)
        if ("undefined" !== typeof Audio) try {
            new Audio
        } catch (j) {
            e = !0
        } else e = !0;
    if (d) {
        var t = "undefined" === typeof c.createGain ? c.createGainNode() : c.createGain();
        t.gain.value = 1;
        t.connect(c.destination)
    }
    var m = function(b) {
        this._volume = 1;
        this._muted = !1;
        this.usingWebAudio = d;
        this.ctx = c;
        this.noAudio = e;
        this._howls = [];
        this._codecs = b;
        this.iOSAutoEnable = !0
    };
    m.prototype = {
        volume: function(b) {
            b = parseFloat(b);
            if (0 <= b && 1 >= b) {
                this._volume = b;
                d && (t.gain.value = b);
                for (var c in this._howls)
                    if (this._howls.hasOwnProperty(c) && !1 === this._howls[c]._webAudio)
                        for (b = 0; b < this._howls[c]._audioNode.length; b++) this._howls[c]._audioNode[b].volume = this._howls[c]._volume * this._volume;
                return this
            }
            return d ? t.gain.value : this._volume
        },
        mute: function() {
            this._setMuted(!0);
            return this
        },
        unmute: function() {
            this._setMuted(!1);
            return this
        },
        _setMuted: function(b) {
            this._muted = b;
            d && (t.gain.value =
                b ? 0 : this._volume);
            for (var c in this._howls)
                if (this._howls.hasOwnProperty(c) && !1 === this._howls[c]._webAudio)
                    for (var e = 0; e < this._howls[c]._audioNode.length; e++) this._howls[c]._audioNode[e].muted = b
        },
        codecs: function(b) {
            return this._codecs[b]
        },
        _enableiOSAudio: function() {
            var b = this;
            if (!c || !b._iOSEnabled && /iPhone|iPad|iPod/i.test(navigator.userAgent)) {
                b._iOSEnabled = !1;
                var d = function() {
                    var e = c.createBuffer(1, 1, 22050),
                        f = c.createBufferSource();
                    f.buffer = e;
                    f.connect(c.destination);
                    "undefined" === typeof f.start ?
                        f.noteOn(0) : f.start(0);
                    setTimeout(function() {
                        if (f.playbackState === f.PLAYING_STATE || f.playbackState === f.FINISHED_STATE) b._iOSEnabled = !0, b.iOSAutoEnable = !1, window.removeEventListener("touchend", d, !1)
                    }, 0)
                };
                window.addEventListener("touchend", d, !1);
                return b
            }
        }
    };
    var r = null,
        x = {};
    e || (r = new Audio, x = {
        mp3: !!r.canPlayType("audio/mpeg;").replace(/^no$/, ""),
        opus: !!r.canPlayType('audio/ogg; codecs="opus"').replace(/^no$/, ""),
        ogg: !!r.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/, ""),
        wav: !!r.canPlayType('audio/wav; codecs="1"').replace(/^no$/,
            ""),
        aac: !!r.canPlayType("audio/aac;").replace(/^no$/, ""),
        m4a: !!(r.canPlayType("audio/x-m4a;") || r.canPlayType("audio/m4a;") || r.canPlayType("audio/aac;")).replace(/^no$/, ""),
        mp4: !!(r.canPlayType("audio/x-mp4;") || r.canPlayType("audio/mp4;") || r.canPlayType("audio/aac;")).replace(/^no$/, ""),
        weba: !!r.canPlayType('audio/webm; codecs="vorbis"').replace(/^no$/, "")
    });
    var A = new m(x),
        s = function(b) {
            this._autoplay = b.autoplay || !1;
            this._buffer = b.buffer || !1;
            this._duration = b.duration || 0;
            this._format = b.format || null;
            this._loop = b.loop || !1;
            this._loaded = !1;
            this._sprite = b.sprite || {};
            this._src = b.src || "";
            this._pos3d = b.pos3d || [0, 0, -0.5];
            this._volume = void 0 !== b.volume ? b.volume : 1;
            this._urls = b.urls || [];
            this._rate = b.rate || 1;
            this._model = b.model || null;
            this._onload = [b.onload || function() {}];
            this._onloaderror = [b.onloaderror || function() {}];
            this._onend = [b.onend || function() {}];
            this._onpause = [b.onpause || function() {}];
            this._onplay = [b.onplay || function() {}];
            this._onendTimer = [];
            this._webAudio = d && !this._buffer;
            this._audioNode = [];
            this._webAudio &&
                this._setupAudioNode();
            "undefined" !== typeof c && c && A.iOSAutoEnable && A._enableiOSAudio();
            A._howls.push(this);
            this.load()
        };
    s.prototype = {
        load: function() {
            var c = this,
                d = null;
            if (e) c.on("loaderror", Error("No audio support."));
            else {
                for (var f = 0; f < c._urls.length; f++) {
                    var j, s;
                    if (c._format) j = c._format;
                    else if (s = c._urls[f], (j = /^data:audio\/([^;,]+);/i.exec(s)) || (j = /\.([^.]+)$/.exec(s.split("?", 1)[0])), j) j = j[1].toLowerCase();
                    else {
                        c.on("loaderror", Error("Could not extract format from passed URLs, please add format parameter."));
                        return
                    } if (x[j]) {
                        d = c._urls[f];
                        break
                    }
                }
                if (d) {
                    c._src = d;
                    if (c._webAudio) {
                        var r = d;
                        if (r in b) c._duration = b[r].duration, E(c);
                        else if (/^data:[^;]+;base64,/.test(r)) {
                            d = atob(r.split(",")[1]);
                            f = new Uint8Array(d.length);
                            for (j = 0; j < d.length; ++j) f[j] = d.charCodeAt(j);
                            C(f.buffer, c, r)
                        } else {
                            var t = new XMLHttpRequest;
                            t.open("GET", r, !0);
                            t.responseType = "arraybuffer";
                            t.onload = function() {
                                C(t.response, c, r)
                            };
                            t.onerror = function() {
                                c._webAudio && (c._buffer = !0, c._webAudio = !1, c._audioNode = [], delete c._gainNode, delete b[r], c.load())
                            };
                            try {
                                t.send()
                            } catch (ya) {
                                t.onerror()
                            }
                        }
                    } else {
                        var J = new Audio;
                        J.addEventListener("error", function() {
                            J.error && 4 === J.error.code && (m.noAudio = !0);
                            c.on("loaderror", {
                                type: J.error ? J.error.code : 0
                            })
                        }, !1);
                        c._audioNode.push(J);
                        J.src = d;
                        J._pos = 0;
                        J.preload = "auto";
                        J.volume = A._muted ? 0 : c._volume * A.volume();
                        var U = function() {
                            c._duration = Math.ceil(10 * J.duration) / 10;
                            0 === Object.getOwnPropertyNames(c._sprite).length && (c._sprite = {
                                _default: [0, 1E3 * c._duration]
                            });
                            c._loaded || (c._loaded = !0, c.on("load"));
                            c._autoplay && c.play();
                            J.removeEventListener("canplaythrough",
                                U, !1)
                        };
                        J.addEventListener("canplaythrough", U, !1);
                        J.load()
                    }
                    return c
                }
                c.on("loaderror", Error("No codec support for selected audio sources."))
            }
        },
        urls: function(b) {
            return b ? (this.stop(), this._urls = "string" === typeof b ? [b] : b, this._loaded = !1, this.load(), this) : this._urls
        },
        play: function(d, e) {
            var f = this;
            "function" === typeof d && (e = d);
            if (!d || "function" === typeof d) d = "_default";
            if (!f._loaded) return f.on("load", function() {
                f.play(d, e)
            }), f;
            if (!f._sprite[d]) return "function" === typeof e && e(), f;
            f._inactiveNode(function(j) {
                j._sprite =
                    d;
                var m = 0 < j._pos ? j._pos : f._sprite[d][0] / 1E3,
                    s = 0;
                f._webAudio ? (s = f._sprite[d][1] / 1E3 - j._pos, 0 < j._pos && (m = f._sprite[d][0] / 1E3 + m)) : s = f._sprite[d][1] / 1E3 - (m - f._sprite[d][0] / 1E3);
                var r = !(!f._loop && !f._sprite[d][2]),
                    x = "string" === typeof e ? e : Math.round(Date.now() * Math.random()) + "",
                    t;
                t = setTimeout(function() {
                    !f._webAudio && r && f.stop(x).play(d, x);
                    f._webAudio && !r && (f._nodeById(x).paused = !0, f._nodeById(x)._pos = 0, f._clearEndTimer(x));
                    !f._webAudio && !r && f.stop(x);
                    f.on("end", x)
                }, 1E3 * (s / f._rate));
                f._onendTimer.push({
                    timer: t,
                    id: x
                });
                if (f._webAudio) {
                    t = f._sprite[d][0] / 1E3;
                    var C = f._sprite[d][1] / 1E3;
                    j.id = x;
                    j.paused = !1;
                    t = [r, t, C];
                    C = f._nodeById(x);
                    C.bufferSource = c.createBufferSource();
                    C.bufferSource.buffer = b[f._src];
                    C.bufferSource.connect(C.panner);
                    C.bufferSource.loop = t[0];
                    t[0] && (C.bufferSource.loopStart = t[1], C.bufferSource.loopEnd = t[1] + t[2]);
                    C.bufferSource.playbackRate.value = f._rate;
                    f._playStart = c.currentTime;
                    j.gain.value = f._volume;
                    "undefined" === typeof j.bufferSource.start ? r ? j.bufferSource.noteGrainOn(0, m, 86400) : j.bufferSource.noteGrainOn(0,
                        m, s) : r ? j.bufferSource.start(0, m, 86400) : j.bufferSource.start(0, m, s)
                } else if (4 === j.readyState || !j.readyState && navigator.isCocoonJS) j.readyState = 4, j.id = x, j.currentTime = m, j.muted = A._muted || j.muted, j.volume = f._volume * A.volume(), setTimeout(function() {
                    j.play()
                }, 0);
                else {
                    f._clearEndTimer(x);
                    var E = d,
                        za = e,
                        qa = function() {
                            f.play(E, za);
                            j.removeEventListener("canplaythrough", qa, !1)
                        };
                    j.addEventListener("canplaythrough", qa, !1);
                    return f
                }
                f.on("play");
                "function" === typeof e && e(x);
                return f
            });
            return f
        },
        pause: function(b) {
            var c =
                this;
            if (!c._loaded) return c.on("play", function() {
                c.pause(b)
            }), c;
            c._clearEndTimer(b);
            var d = b ? c._nodeById(b) : c._activeNode();
            if (d)
                if (d._pos = c.pos(null, b), c._webAudio) {
                    if (!d.bufferSource || d.paused) return c;
                    d.paused = !0;
                    "undefined" === typeof d.bufferSource.stop ? d.bufferSource.noteOff(0) : d.bufferSource.stop(0)
                } else d.pause();
            c.on("pause");
            return c
        },
        stop: function(b) {
            var c = this;
            if (!c._loaded) return c.on("play", function() {
                c.stop(b)
            }), c;
            c._clearEndTimer(b);
            var d = b ? c._nodeById(b) : c._activeNode();
            if (d)
                if (d._pos =
                    0, c._webAudio) {
                    if (!d.bufferSource || d.paused) return c;
                    d.paused = !0;
                    "undefined" === typeof d.bufferSource.stop ? d.bufferSource.noteOff(0) : d.bufferSource.stop(0)
                } else isNaN(d.duration) || (d.pause(), d.currentTime = 0);
            return c
        },
        mute: function(b) {
            var c = this;
            if (!c._loaded) return c.on("play", function() {
                c.mute(b)
            }), c;
            var d = b ? c._nodeById(b) : c._activeNode();
            d && (c._webAudio ? d.gain.value = 0 : d.muted = !0);
            return c
        },
        unmute: function(b) {
            var c = this;
            if (!c._loaded) return c.on("play", function() {
                c.unmute(b)
            }), c;
            var d = b ? c._nodeById(b) :
                c._activeNode();
            d && (c._webAudio ? d.gain.value = c._volume : d.muted = !1);
            return c
        },
        volume: function(b, c) {
            var d = this;
            b = parseFloat(b);
            if (0 <= b && 1 >= b) {
                d._volume = b;
                if (!d._loaded) return d.on("play", function() {
                    d.volume(b, c)
                }), d;
                var e = c ? d._nodeById(c) : d._activeNode();
                e && (d._webAudio ? e.gain.value = b : e.volume = b * A.volume());
                return d
            }
            return d._volume
        },
        loop: function(b) {
            return "boolean" === typeof b ? (this._loop = b, this) : this._loop
        },
        sprite: function(b) {
            return "object" === typeof b ? (this._sprite = b, this) : this._sprite
        },
        pos: function(b,
            d) {
            var e = this;
            if (!e._loaded) return e.on("load", function() {
                e.pos(b)
            }), "number" === typeof b ? e : e._pos || 0;
            b = parseFloat(b);
            var f = d ? e._nodeById(d) : e._activeNode();
            if (f) return 0 <= b ? (e.pause(d), f._pos = b, e.play(f._sprite, d), e) : e._webAudio ? f._pos + (c.currentTime - e._playStart) : f.currentTime;
            if (0 <= b) return e;
            for (f = 0; f < e._audioNode.length; f++)
                if (e._audioNode[f].paused && 4 === e._audioNode[f].readyState) return e._webAudio ? e._audioNode[f]._pos : e._audioNode[f].currentTime
        },
        pos3d: function(b, c, d, e) {
            var f = this;
            c = "undefined" ===
                typeof c || !c ? 0 : c;
            d = "undefined" === typeof d || !d ? -0.5 : d;
            if (!f._loaded) return f.on("play", function() {
                f.pos3d(b, c, d, e)
            }), f;
            if (0 <= b || 0 > b) {
                if (f._webAudio) {
                    var j = e ? f._nodeById(e) : f._activeNode();
                    j && (f._pos3d = [b, c, d], j.panner.setPosition(b, c, d), j.panner.panningModel = f._model || "HRTF")
                }
            } else return f._pos3d;
            return f
        },
        fade: function(b, c, d, e, f) {
            var j = this,
                m = Math.abs(b - c),
                s = b > c ? "down" : "up",
                m = m / 0.01,
                r = d / m;
            if (!j._loaded) return j.on("load", function() {
                j.fade(b, c, d, e, f)
            }), j;
            j.volume(b, f);
            for (var x = 1; x <= m; x++)(function() {
                var b =
                    Math.round(1E3 * (j._volume + ("up" === s ? 0.01 : -0.01) * x)) / 1E3;
                setTimeout(function() {
                    j.volume(b, f);
                    b === c && e && e()
                }, r * x)
            })()
        },
        fadeIn: function(b, c, d) {
            return this.volume(0).play().fade(0, b, c, d)
        },
        fadeOut: function(b, c, d, e) {
            var f = this;
            return f.fade(f._volume, b, c, function() {
                d && d();
                f.pause(e);
                f.on("end")
            }, e)
        },
        _nodeById: function(b) {
            for (var c = this._audioNode[0], d = 0; d < this._audioNode.length; d++)
                if (this._audioNode[d].id === b) {
                    c = this._audioNode[d];
                    break
                }
            return c
        },
        _activeNode: function() {
            for (var b = null, c = 0; c < this._audioNode.length; c++)
                if (!this._audioNode[c].paused) {
                    b =
                        this._audioNode[c];
                    break
                }
            this._drainPool();
            return b
        },
        _inactiveNode: function(b) {
            for (var c = null, d = 0; d < this._audioNode.length; d++)
                if (this._audioNode[d].paused && 4 === this._audioNode[d].readyState) {
                    b(this._audioNode[d]);
                    c = !0;
                    break
                }
            this._drainPool();
            if (!c) {
                var e;
                if (this._webAudio) e = this._setupAudioNode(), b(e);
                else {
                    this.load();
                    e = this._audioNode[this._audioNode.length - 1];
                    var f = navigator.isCocoonJS ? "canplaythrough" : "loadedmetadata",
                        j = function() {
                            e.removeEventListener(f, j, !1);
                            b(e)
                        };
                    e.addEventListener(f, j, !1)
                }
            }
        },
        _drainPool: function() {
            var b = 0,
                c;
            for (c = 0; c < this._audioNode.length; c++) this._audioNode[c].paused && b++;
            for (c = this._audioNode.length - 1; 0 <= c && !(5 >= b); c--) this._audioNode[c].paused && (this._webAudio && this._audioNode[c].disconnect(0), b--, this._audioNode.splice(c, 1))
        },
        _clearEndTimer: function(b) {
            for (var c = -1, d = 0; d < this._onendTimer.length; d++)
                if (this._onendTimer[d].id === b) {
                    c = d;
                    break
                }
            if (b = this._onendTimer[c]) clearTimeout(b.timer), this._onendTimer.splice(c, 1)
        },
        _setupAudioNode: function() {
            var b = this._audioNode,
                d = this._audioNode.length;
            b[d] = "undefined" === typeof c.createGain ? c.createGainNode() : c.createGain();
            b[d].gain.value = this._volume;
            b[d].paused = !0;
            b[d]._pos = 0;
            b[d].readyState = 4;
            b[d].connect(t);
            b[d].panner = c.createPanner();
            b[d].panner.panningModel = this._model || "equalpower";
            b[d].panner.setPosition(this._pos3d[0], this._pos3d[1], this._pos3d[2]);
            b[d].panner.connect(b[d]);
            return b[d]
        },
        on: function(b, c) {
            var d = this["_on" + b];
            if ("function" === typeof c) d.push(c);
            else
                for (var e = 0; e < d.length; e++) c ? d[e].call(this, c) :
                    d[e].call(this);
            return this
        },
        off: function(b, c) {
            var d = this["_on" + b];
            if (c)
                for (var e = 0; e < d.length; e++) {
                    if (c === d[e]) {
                        d.splice(e, 1);
                        break
                    }
                } else this["_on" + b] = [];
            return this
        },
        unload: function() {
            for (var c = this._audioNode, d = 0; d < this._audioNode.length; d++) c[d].paused || (this.stop(c[d].id), this.on("end", c[d].id)), this._webAudio ? c[d].disconnect(0) : c[d].src = "";
            for (d = 0; d < this._onendTimer.length; d++) clearTimeout(this._onendTimer[d].timer);
            c = A._howls.indexOf(this);
            null !== c && 0 <= c && A._howls.splice(c, 1);
            delete b[this._src]
        }
    };
    if (d) var C = function(d, e, f) {
            c.decodeAudioData(d, function(c) {
                c && (b[f] = c, E(e, c))
            }, function(b) {
                e.on("loaderror", b)
            })
        },
        E = function(b, c) {
            b._duration = c ? c.duration : b._duration;
            0 === Object.getOwnPropertyNames(b._sprite).length && (b._sprite = {
                _default: [0, 1E3 * b._duration]
            });
            b._loaded || (b._loaded = !0, b.on("load"));
            b._autoplay && b.play()
        };
    "function" === typeof define && define.amd && define(function() {
        return {
            Howler: A,
            Howl: s
        }
    });
    "undefined" !== typeof exports && (exports.Howler = A, exports.Howl = s);
    "undefined" !== typeof window && (window.Howler =
        A, window.Howl = s)
})();
(function(b) {
    Number.prototype.min = function(b) {
        return this <= b ? b : this
    };
    Number.prototype.max = function(b) {
        return this >= b ? b : this
    };
    Number.prototype.map = function(b, c, d, e) {
        return d + (e - d) * ((this - b) / (c - b))
    };
    Number.prototype.limit = function(b, c) {
        return Math.min(c, Math.max(b, this))
    };
    Number.prototype.round = function(b) {
        b = Math.pow(10, b || 0);
        return Math.round(this * b) / b
    };
    Number.prototype.floor = function() {
        return Math.floor(this)
    };
    Number.prototype.ceil = function() {
        return Math.ceil(this)
    };
    Number.prototype.toInt = function() {
        return this |
            0
    };
    Number.prototype.toRad = function() {
        return this / 180 * Math.PI
    };
    Number.prototype.toDeg = function() {
        return 180 * this / Math.PI
    };
    Array.prototype.erase = function(b) {
        for (var c = this.length; c--;) this[c] === b && this.splice(c, 1);
        return this
    };
    Array.prototype.random = function() {
        return this[Math.floor(Math.random() * this.length)]
    };
    Function.prototype.bind = Function.prototype.bind || function(b) {
        if ("function" !== typeof this) throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
        var c = Array.prototype.slice.call(arguments,
                1),
            d = this,
            e = function() {},
            f = function() {
                return d.apply(this instanceof e && b ? this : b, c.concat(Array.prototype.slice.call(arguments)))
            };
        e.prototype = this.prototype;
        f.prototype = new e;
        return f
    };
    b.ig = {
        game: null,
        debug: null,
        version: "1.23",
        global: b,
        modules: {},
        resources: [],
        ready: !1,
        baked: !1,
        nocache: "",
        ua: {},
        prefix: b.ImpactPrefix || "",
        lib: "lib/",
        _current: null,
        _loadQueue: [],
        _waitForOnload: 0,
        $: function(b) {
            return "#" == b.charAt(0) ? document.getElementById(b.substr(1)) : document.getElementsByTagName(b)
        },
        $new: function(b) {
            return document.createElement(b)
        },
        copy: function(b) {
            if (!b || "object" != typeof b || b instanceof HTMLElement || b instanceof ig.Class) return b;
            if (b instanceof Array)
                for (var c = [], d = 0, e = b.length; d < e; d++) c[d] = ig.copy(b[d]);
            else
                for (d in c = {}, b) c[d] = ig.copy(b[d]);
            return c
        },
        merge: function(b, c) {
            for (var d in c) {
                var e = c[d];
                if ("object" != typeof e || e instanceof HTMLElement || e instanceof ig.Class || null === e) b[d] = e;
                else {
                    if (!b[d] || "object" != typeof b[d]) b[d] = e instanceof Array ? [] : {};
                    ig.merge(b[d], e)
                }
            }
            return b
        },
        ksort: function(b) {
            if (!b || "object" != typeof b) return [];
            var c = [],
                d = [],
                e;
            for (e in b) c.push(e);
            c.sort();
            for (e = 0; e < c.length; e++) d.push(b[c[e]]);
            return d
        },
        setVendorAttribute: function(b, c, d) {
            var e = c.charAt(0).toUpperCase() + c.substr(1);
            b[c] = "undefined" !== typeof b.imageSmoothingEnabled ? b["ms" + e] = b["moz" + e] = b["o" + e] = d : b["ms" + e] = b["moz" + e] = b["webkit" + e] = b["o" + e] = d
        },
        getVendorAttribute: function(b, c) {
            var d = c.charAt(0).toUpperCase() + c.substr(1);
            return "undefined" !== typeof b.imageSmoothingEnabled ? b[c] || b["ms" + d] || b["moz" + d] || b["o" + d] : b[c] || b["ms" + d] || b["moz" + d] || b["webkit" +
                d] || b["o" + d]
        },
        normalizeVendorAttribute: function(b, c) {
            var d = ig.getVendorAttribute(b, c);
            !b[c] && d && (b[c] = d)
        },
        getImagePixels: function(b, c, d, e, f) {
            var j = ig.$new("canvas");
            j.width = b.width;
            j.height = b.height;
            var t = j.getContext("2d");
            ig.System.SCALE.CRISP(j, t);
            var n = ig.getVendorAttribute(t, "backingStorePixelRatio") || 1;
            ig.normalizeVendorAttribute(t, "getImageDataHD");
            var u = b.width / n,
                y = b.height / n;
            j.width = Math.ceil(u);
            j.height = Math.ceil(y);
            t.drawImage(b, 0, 0, u, y);
            return 1 === n ? t.getImageData(c, d, e, f) : t.getImageDataHD(c,
                d, e, f)
        },
        module: function(b) {
            if (ig._current) throw "Module '" + ig._current.name + "' defines nothing";
            if (ig.modules[b] && ig.modules[b].body) throw "Module '" + b + "' is already defined";
            ig._current = {
                name: b,
                requires: [],
                loaded: !1,
                body: null
            };
            ig.modules[b] = ig._current;
            ig._loadQueue.push(ig._current);
            return ig
        },
        requires: function() {
            ig._current.requires = Array.prototype.slice.call(arguments);
            return ig
        },
        defines: function(b) {
            ig._current.body = b;
            ig._current = null;
            ig._initDOMReady()
        },
        addResource: function(b) {
            ig.resources.push(b)
        },
        setNocache: function(b) {
            ig.nocache = b ? "?" + Date.now() : ""
        },
        log: function() {},
        assert: function() {},
        show: function() {},
        mark: function() {},
        _loadScript: function(b, c) {
            ig.modules[b] = {
                name: b,
                requires: [],
                loaded: !1,
                body: null
            };
            ig._waitForOnload++;
            var d = ig.prefix + ig.lib + b.replace(/\./g, "/") + ".js" + ig.nocache,
                e = ig.$new("script");
            e.type = "text/javascript";
            e.src = d;
            e.onload = function() {
                ig._waitForOnload--;
                ig._execModules()
            };
            e.onerror = function() {
                throw "Failed to load module " + b + " at " + d + " required from " + c;
            };
            ig.$("head")[0].appendChild(e)
        },
        _execModules: function() {
            for (var b = !1, c = 0; c < ig._loadQueue.length; c++) {
                for (var d = ig._loadQueue[c], e = !0, f = 0; f < d.requires.length; f++) {
                    var j = d.requires[f];
                    ig.modules[j] ? ig.modules[j].loaded || (e = !1) : (e = !1, ig._loadScript(j, d.name))
                }
                e && d.body && (ig._loadQueue.splice(c, 1), d.loaded = !0, d.body(), b = !0, c--)
            }
            if (b) ig._execModules();
            else if (!ig.baked && 0 == ig._waitForOnload && 0 != ig._loadQueue.length) {
                b = [];
                for (c = 0; c < ig._loadQueue.length; c++) {
                    e = [];
                    j = ig._loadQueue[c].requires;
                    for (f = 0; f < j.length; f++) d = ig.modules[j[f]], (!d ||
                        !d.loaded) && e.push(j[f]);
                    b.push(ig._loadQueue[c].name + " (requires: " + e.join(", ") + ")")
                }
                throw "Unresolved (or circular?) dependencies. Most likely there's a name/path mismatch for one of the listed modules or a previous syntax error prevents a module from loading:\n" + b.join("\n");
            }
        },
        _DOMReady: function() {
            if (!ig.modules["dom.ready"].loaded) {
                if (!document.body) return setTimeout(ig._DOMReady, 13);
                ig.modules["dom.ready"].loaded = !0;
                ig._waitForOnload--;
                ig._execModules()
            }
            return 0
        },
        _boot: function() {
            document.location.href.match(/\?nocache/) &&
                ig.setNocache(!0);
            ig.ua.pixelRatio = b.devicePixelRatio || 1;
            ig.ua.viewport = {
                width: b.innerWidth,
                height: b.innerHeight
            };
            ig.ua.screen = {
                width: b.screen.availWidth * ig.ua.pixelRatio,
                height: b.screen.availHeight * ig.ua.pixelRatio
            };
            ig.ua.iPhone = /iPhone/i.test(navigator.userAgent);
            ig.ua.iPhone4 = ig.ua.iPhone && 2 == ig.ua.pixelRatio;
            ig.ua.iPad = /iPad/i.test(navigator.userAgent);
            ig.ua.android = /android/i.test(navigator.userAgent);
            ig.ua.winPhone = /Windows Phone/i.test(navigator.userAgent);
            ig.ua.is_uiwebview = /(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/i.test(navigator.userAgent);
            ig.ua.is_safari_or_uiwebview = /(iPhone|iPod|iPad).*AppleWebKit/i.test(navigator.userAgent);
            ig.ua.iOS = ig.ua.iPhone || ig.ua.iPad;
            ig.ua.iOS6_tag = /OS 6_/i.test(navigator.userAgent);
            ig.ua.iOS6 = (ig.ua.iPhone || ig.ua.iPad) && ig.ua.iOS6_tag;
            ig.ua.iOSgt5 = ig.ua.iOS && 5 < parseInt(navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/)[1]);
            ig.ua.HTCONE = /HTC_One/i.test(navigator.userAgent);
            ig.ua.winPhone = /Windows Phone/i.test(navigator.userAgent);
            ig.ua.Kindle = /Silk/i.test(navigator.userAgent);
            ig.ua.touchDevice = "ontouchstart" in
                b || b.navigator.msMaxTouchPoints;
            ig.ua.mobile = ig.ua.iOS || ig.ua.android || ig.ua.iOS6 || ig.ua.winPhone || ig.ua.Kindle || /mobile/i.test(navigator.userAgent)
        },
        _initDOMReady: function() {
            ig.modules["dom.ready"] ? ig._execModules() : (ig._boot(), ig.modules["dom.ready"] = {
                requires: [],
                loaded: !1,
                body: null
            }, ig._waitForOnload++, "complete" === document.readyState ? ig._DOMReady() : (document.addEventListener("DOMContentLoaded", ig._DOMReady, !1), b.addEventListener("load", ig._DOMReady, !1)))
        }
    };
    ig.normalizeVendorAttribute(b, "requestAnimationFrame");
    if (b.requestAnimationFrame) {
        var c = 1,
            d = {};
        b.ig.setAnimation = function(e, f) {
            var j = c++;
            d[j] = !0;
            var t = function() {
                d[j] && (b.requestAnimationFrame(t, f), e())
            };
            b.requestAnimationFrame(t, f);
            return j
        };
        b.ig.clearAnimation = function(b) {
            delete d[b]
        }
    } else b.ig.setAnimation = function(c) {
        return b.setInterval(c, 1E3 / 60)
    }, b.ig.clearAnimation = function(c) {
        b.clearInterval(c)
    };
    var e = !1,
        f = /xyz/.test(function() {
            xyz
        }) ? /\bparent\b/ : /.*/,
        j = 0;
    b.ig.Class = function() {};
    var t = function(b) {
        var c = this.prototype,
            d = {},
            e;
        for (e in b) "function" ==
            typeof b[e] && "function" == typeof c[e] && f.test(b[e]) ? (d[e] = c[e], c[e] = function(b, c) {
                return function() {
                    var e = this.parent;
                    this.parent = d[b];
                    var f = c.apply(this, arguments);
                    this.parent = e;
                    return f
                }
            }(e, b[e])) : c[e] = b[e]
    };
    b.ig.Class.extend = function(c) {
        function d() {
            if (!e) {
                if (this.staticInstantiate) {
                    var b = this.staticInstantiate.apply(this, arguments);
                    if (b) return b
                }
                for (var c in this) "object" == typeof this[c] && (this[c] = ig.copy(this[c]));
                this.init && this.init.apply(this, arguments)
            }
            return this
        }
        var x = this.prototype;
        e = !0;
        var A = new this;
        e = !1;
        for (var s in c) A[s] = "function" == typeof c[s] && "function" == typeof x[s] && f.test(c[s]) ? function(b, c) {
            return function() {
                var d = this.parent;
                this.parent = x[b];
                var e = c.apply(this, arguments);
                this.parent = d;
                return e
            }
        }(s, c[s]) : c[s];
        d.prototype = A;
        d.prototype.constructor = d;
        d.extend = b.ig.Class.extend;
        d.inject = t;
        d.classId = A.classId = ++j;
        return d
    };
    b.ImpactMixin && ig.merge(ig, b.ImpactMixin)
})(window);
ig.baked = !0;
ig.module("impact.image").defines(function() {
    ig.Image = ig.Class.extend({
        data: null,
        width: 0,
        height: 0,
        loaded: !1,
        failed: !1,
        loadCallback: null,
        path: "",
        staticInstantiate: function(b) {
            return ig.Image.cache[b] || null
        },
        init: function(b) {
            this.path = b;
            this.load()
        },
        load: function(b) {
            this.loaded ? b && b(this.path, !0) : (!this.loaded && ig.ready ? (this.loadCallback = b || null, this.data = new Image, this.data.onload = this.onload.bind(this), this.data.onerror = this.onerror.bind(this), this.data.src = ig.prefix + this.path + ig.nocache) : ig.addResource(this),
                ig.Image.cache[this.path] = this)
        },
        reload: function() {
            this.loaded = !1;
            this.data = new Image;
            this.data.onload = this.onload.bind(this);
            this.data.src = this.path + "?" + Date.now()
        },
        onload: function() {
            this.width = this.data.width;
            this.height = this.data.height;
            this.loaded = !0;
            1 != ig.system.scale && this.resize(ig.system.scale);
            this.loadCallback && this.loadCallback(this.path, !0)
        },
        onerror: function() {
            this.failed = !0;
            this.loadCallback && this.loadCallback(this.path, !1)
        },
        resize: function(b) {
            var c = ig.getImagePixels(this.data, 0, 0, this.width,
                    this.height),
                d = this.width * b,
                e = this.height * b,
                f = ig.$new("canvas");
            f.width = d;
            f.height = e;
            for (var j = f.getContext("2d"), t = j.getImageData(0, 0, d, e), m = 0; m < e; m++)
                for (var r = 0; r < d; r++) {
                    var x = 4 * (Math.floor(m / b) * this.width + Math.floor(r / b)),
                        A = 4 * (m * d + r);
                    t.data[A] = c.data[x];
                    t.data[A + 1] = c.data[x + 1];
                    t.data[A + 2] = c.data[x + 2];
                    t.data[A + 3] = c.data[x + 3]
                }
            j.putImageData(t, 0, 0);
            this.data = f
        },
        draw: function(b, c, d, e, f, j) {
            if (this.loaded) {
                var t = ig.system.scale;
                f = (f ? f : this.width) * t;
                j = (j ? j : this.height) * t;
                ig.system.context.drawImage(this.data,
                    d ? d * t : 0, e ? e * t : 0, f, j, ig.system.getDrawPos(b), ig.system.getDrawPos(c), f, j);
                ig.Image.drawCount++
            }
        },
        drawTile: function(b, c, d, e, f, j, t) {
            f = f ? f : e;
            if (this.loaded && !(e > this.width || f > this.height)) {
                var m = ig.system.scale,
                    r = Math.floor(e * m),
                    x = Math.floor(f * m),
                    A = j ? -1 : 1,
                    s = t ? -1 : 1;
                if (j || t) ig.system.context.save(), ig.system.context.scale(A, s);
                ig.system.context.drawImage(this.data, Math.floor(d * e) % this.width * m, Math.floor(d * e / this.width) * f * m, r, x, ig.system.getDrawPos(b) * A - (j ? r : 0), ig.system.getDrawPos(c) * s - (t ? x : 0), r, x);
                (j ||
                    t) && ig.system.context.restore();
                ig.Image.drawCount++
            }
        }
    });
    ig.Image.drawCount = 0;
    ig.Image.cache = {};
    ig.Image.reloadCache = function() {
        for (var b in ig.Image.cache) ig.Image.cache[b].reload()
    }
});
ig.baked = !0;
ig.module("impact.font").requires("impact.image").defines(function() {
    ig.Font = ig.Image.extend({
        widthMap: [],
        indices: [],
        firstChar: 32,
        alpha: 1,
        letterSpacing: 1,
        lineSpacing: 0,
        onload: function(b) {
            this._loadMetrics(this.data);
            this.parent(b)
        },
        widthForString: function(b) {
            if (-1 !== b.indexOf("\n")) {
                b = b.split("\n");
                for (var c = 0, d = 0; d < b.length; d++) c = Math.max(c, this._widthForLine(b[d]));
                return c
            }
            return this._widthForLine(b)
        },
        _widthForLine: function(b) {
            for (var c = 0, d = 0; d < b.length; d++) c += this.widthMap[b.charCodeAt(d) - this.firstChar] +
                this.letterSpacing;
            return c
        },
        heightForString: function(b) {
            return b.split("\n").length * (this.height + this.lineSpacing)
        },
        draw: function(b, c, d, e) {
            "string" != typeof b && (b = b.toString());
            if (-1 !== b.indexOf("\n")) {
                b = b.split("\n");
                for (var f = this.height + this.lineSpacing, j = 0; j < b.length; j++) this.draw(b[j], c, d + j * f, e)
            } else {
                if (e == ig.Font.ALIGN.RIGHT || e == ig.Font.ALIGN.CENTER) j = this._widthForLine(b), c -= e == ig.Font.ALIGN.CENTER ? j / 2 : j;
                1 !== this.alpha && (ig.system.context.globalAlpha = this.alpha);
                for (j = 0; j < b.length; j++) e = b.charCodeAt(j),
                    c += this._drawChar(e - this.firstChar, c, d);
                1 !== this.alpha && (ig.system.context.globalAlpha = 1);
                ig.Image.drawCount += b.length
            }
        },
        _drawChar: function(b, c, d) {
            if (!this.loaded || 0 > b || b >= this.indices.length) return 0;
            var e = ig.system.scale,
                f = this.widthMap[b] * e,
                j = (this.height - 2) * e;
            ig.system.context.drawImage(this.data, this.indices[b] * e, 0, f, j, ig.system.getDrawPos(c), ig.system.getDrawPos(d), f, j);
            return this.widthMap[b] + this.letterSpacing
        },
        _loadMetrics: function(b) {
            this.height = b.height - 1;
            this.widthMap = [];
            this.indices = [];
            for (var c = ig.getImagePixels(b, 0, b.height - 1, b.width, 1), d = 0, e = 0, f = 0; f < b.width; f++) {
                var j = 4 * f + 3;
                127 < c.data[j] ? e++ : 128 > c.data[j] && e && (this.widthMap.push(e), this.indices.push(f - e), d++, e = 0)
            }
            this.widthMap.push(e);
            this.indices.push(f - e)
        }
    });
    ig.Font.ALIGN = {
        LEFT: 0,
        RIGHT: 1,
        CENTER: 2
    }
});
ig.baked = !0;
ig.module("impact.sound").defines(function() {
    ig.SoundManager = ig.Class.extend({
        clips: {},
        volume: 1,
        format: null,
        init: function() {
            if (!ig.Sound.enabled || !window.Audio) ig.Sound.enabled = !1;
            else {
                for (var b = new Audio, c = 0; c < ig.Sound.use.length; c++) {
                    var d = ig.Sound.use[c];
                    if (b.canPlayType(d.mime)) {
                        this.format = d;
                        break
                    }
                }
                this.format || (ig.Sound.enabled = !1)
            }
        },
        load: function(b, c, d) {
            var e = ig.prefix + b.replace(/[^\.]+$/, this.format.ext) + ig.nocache;
            if (this.clips[b]) {
                if (c && this.clips[b].length < ig.Sound.channels)
                    for (c = this.clips[b].length; c <
                        ig.Sound.channels; c++) {
                        var f = new Audio(e);
                        f.load();
                        this.clips[b].push(f)
                    }
                return this.clips[b][0]
            }
            var j = new Audio(e);
            d && (j.addEventListener("canplaythrough", function m(c) {
                j.removeEventListener("canplaythrough", m, !1);
                d(b, !0, c)
            }, !1), j.addEventListener("error", function(c) {
                d(b, !1, c)
            }, !1));
            j.preload = "auto";
            j.load();
            this.clips[b] = [j];
            if (c)
                for (c = 1; c < ig.Sound.channels; c++) f = new Audio(e), f.load(), this.clips[b].push(f);
            return j
        },
        get: function(b) {
            b = this.clips[b];
            for (var c = 0, d; d = b[c++];)
                if (d.paused || d.ended) return d.ended &&
                    (d.currentTime = 0), d;
            b[0].pause();
            b[0].currentTime = 0;
            return b[0]
        }
    });
    ig.Music = ig.Class.extend({
        tracks: [],
        namedTracks: {},
        currentTrack: null,
        currentIndex: 0,
        random: !1,
        _volume: 1,
        _loop: !1,
        _fadeInterval: 0,
        _fadeTimer: null,
        _endedCallbackBound: null,
        init: function() {
            this._endedCallbackBound = this._endedCallback.bind(this);
            Object.defineProperty ? (Object.defineProperty(this, "volume", {
                    get: this.getVolume.bind(this),
                    set: this.setVolume.bind(this)
                }), Object.defineProperty(this, "loop", {
                    get: this.getLooping.bind(this),
                    set: this.setLooping.bind(this)
                })) :
                this.__defineGetter__ && (this.__defineGetter__("volume", this.getVolume.bind(this)), this.__defineSetter__("volume", this.setVolume.bind(this)), this.__defineGetter__("loop", this.getLooping.bind(this)), this.__defineSetter__("loop", this.setLooping.bind(this)))
        },
        add: function(b, c) {
            if (ig.Sound.enabled) {
                var d = ig.soundManager.load(b instanceof ig.Sound ? b.path : b, !1);
                d.loop = this._loop;
                d.volume = this._volume;
                d.addEventListener("ended", this._endedCallbackBound, !1);
                this.tracks.push(d);
                c && (this.namedTracks[c] = d);
                this.currentTrack ||
                    (this.currentTrack = d)
            }
        },
        next: function() {
            this.tracks.length && (this.stop(), this.currentIndex = this.random ? Math.floor(Math.random() * this.tracks.length) : (this.currentIndex + 1) % this.tracks.length, this.currentTrack = this.tracks[this.currentIndex], this.play())
        },
        pause: function() {
            this.currentTrack && this.currentTrack.pause()
        },
        stop: function() {
            this.currentTrack && (this.currentTrack.pause(), this.currentTrack.currentTime = 0)
        },
        play: function(b) {
            if (b && this.namedTracks[b]) b = this.namedTracks[b], b != this.currentTrack && (this.stop(),
                this.currentTrack = b);
            else if (!this.currentTrack) return;
            this.currentTrack.play()
        },
        getLooping: function() {
            return this._loop
        },
        setLooping: function(b) {
            this._loop = b;
            for (var c in this.tracks) this.tracks[c].loop = b
        },
        getVolume: function() {
            return this._volume
        },
        setVolume: function(b) {
            this._volume = b.limit(0, 1);
            for (var c in this.tracks) this.tracks[c].volume = this._volume
        },
        fadeOut: function(b) {
            this.currentTrack && (clearInterval(this._fadeInterval), this.fadeTimer = new ig.Timer(b), this._fadeInterval = setInterval(this._fadeStep.bind(this),
                50))
        },
        _fadeStep: function() {
            var b = this.fadeTimer.delta().map(-this.fadeTimer.target, 0, 1, 0).limit(0, 1) * this._volume;
            0.01 >= b ? (this.stop(), this.currentTrack.volume = this._volume, clearInterval(this._fadeInterval)) : this.currentTrack.volume = b
        },
        _endedCallback: function() {
            this._loop ? this.play() : this.next()
        }
    });
    ig.Sound = ig.Class.extend({
        path: "",
        volume: 1,
        currentClip: null,
        multiChannel: !0,
        init: function(b, c) {
            this.path = b;
            this.multiChannel = !1 !== c;
            this.load()
        },
        load: function(b) {
            ig.Sound.enabled ? ig.ready ? ig.soundManager.load(this.path,
                this.multiChannel, b) : ig.addResource(this) : b && b(this.path, !0)
        },
        play: function() {
            ig.Sound.enabled && (this.currentClip = ig.soundManager.get(this.path), this.currentClip.volume = ig.soundManager.volume * this.volume, this.currentClip.play())
        },
        stop: function() {
            this.currentClip && (this.currentClip.pause(), this.currentClip.currentTime = 0)
        }
    });
    ig.Sound.FORMAT = {
        MP3: {
            ext: "mp3",
            mime: "audio/mpeg"
        },
        M4A: {
            ext: "m4a",
            mime: "audio/mp4; codecs=mp4a"
        },
        OGG: {
            ext: "ogg",
            mime: "audio/ogg; codecs=vorbis"
        },
        WEBM: {
            ext: "webm",
            mime: "audio/webm; codecs=vorbis"
        },
        CAF: {
            ext: "caf",
            mime: "audio/x-caf"
        }
    };
    ig.Sound.use = [ig.Sound.FORMAT.OGG, ig.Sound.FORMAT.MP3];
    ig.Sound.channels = 4;
    ig.Sound.enabled = !0
});
ig.baked = !0;
ig.module("impact.loader").requires("impact.image", "impact.font", "impact.sound").defines(function() {
    ig.Loader = ig.Class.extend({
        resources: [],
        gameClass: null,
        status: 0,
        done: !1,
        _unloaded: [],
        _drawStatus: 0,
        _intervalId: 0,
        _loadCallbackBound: null,
        init: function(b, c) {
            this.gameClass = b;
            this.resources = c;
            this._loadCallbackBound = this._loadCallback.bind(this);
            for (var d = 0; d < this.resources.length; d++) this._unloaded.push(this.resources[d].path)
        },
        load: function() {
            ig.system.clear("#000");
            if (this.resources.length) {
                for (var b =
                    0; b < this.resources.length; b++) this.loadResource(this.resources[b]);
                this._intervalId = setInterval(this.draw.bind(this), 16)
            } else this.end()
        },
        loadResource: function(b) {
            b.load(this._loadCallbackBound)
        },
        end: function() {
            this.done || (this.done = !0, clearInterval(this._intervalId))
        },
        draw: function() {},
        _loadCallback: function(b, c) {
            if (c) this._unloaded.erase(b);
            else throw "Failed to load resource: " + b;
            this.status = 1 - this._unloaded.length / this.resources.length;
            0 == this._unloaded.length && setTimeout(this.end.bind(this), 250)
        }
    })
});
ig.baked = !0;
ig.module("impact.timer").defines(function() {
    ig.Timer = ig.Class.extend({
        target: 0,
        base: 0,
        last: 0,
        pausedAt: 0,
        init: function(b) {
            this.last = this.base = ig.Timer.time;
            this.target = b || 0
        },
        set: function(b) {
            this.target = b || 0;
            this.base = ig.Timer.time;
            this.pausedAt = 0
        },
        reset: function() {
            this.base = ig.Timer.time;
            this.pausedAt = 0
        },
        tick: function() {
            var b = ig.Timer.time - this.last;
            this.last = ig.Timer.time;
            return this.pausedAt ? 0 : b
        },
        delta: function() {
            return (this.pausedAt || ig.Timer.time) - this.base - this.target
        },
        pause: function() {
            this.pausedAt || (this.pausedAt =
                ig.Timer.time)
        },
        unpause: function() {
            this.pausedAt && (this.base += ig.Timer.time - this.pausedAt, this.pausedAt = 0)
        }
    });
    ig.Timer._last = 0;
    ig.Timer.time = Number.MIN_VALUE;
    ig.Timer.timeScale = 1;
    ig.Timer.maxStep = 0.05;
    ig.Timer.step = function() {
        var b = Date.now();
        ig.Timer.time += Math.min((b - ig.Timer._last) / 1E3, ig.Timer.maxStep) * ig.Timer.timeScale;
        ig.Timer._last = b
    }
});
ig.baked = !0;
ig.module("impact.system").requires("impact.timer", "impact.image").defines(function() {
    ig.System = ig.Class.extend({
        fps: 30,
        width: 320,
        height: 240,
        realWidth: 320,
        realHeight: 240,
        scale: 1,
        tick: 0,
        animationId: 0,
        newGameClass: null,
        running: !1,
        delegate: null,
        clock: null,
        canvas: null,
        context: null,
        init: function(b, c, d, e, f) {
            this.fps = c;
            this.clock = new ig.Timer;
            this.canvas = ig.$(b);
            this.resize(d, e, f);
            this.context = this.canvas.getContext("2d");
            this.getDrawPos = ig.System.drawMode;
            1 != this.scale && (ig.System.scaleMode = ig.System.SCALE.CRISP);
            ig.System.scaleMode(this.canvas, this.context)
        },
        resize: function(b, c, d) {
            this.width = b;
            this.height = c;
            this.scale = d || this.scale;
            this.realWidth = this.width * this.scale;
            this.realHeight = this.height * this.scale;
            this.canvas.width = this.realWidth;
            this.canvas.height = this.realHeight
        },
        setGame: function(b) {
            this.running ? this.newGameClass = b : this.setGameNow(b)
        },
        setGameNow: function(b) {
            ig.game = new b;
            ig.system.setDelegate(ig.game)
        },
        setDelegate: function(b) {
            if ("function" == typeof b.run) this.delegate = b, this.startRunLoop();
            else throw "System.setDelegate: No run() function in object";
        },
        stopRunLoop: function() {
            ig.clearAnimation(this.animationId);
            this.running = !1
        },
        startRunLoop: function() {
            this.stopRunLoop();
            this.animationId = ig.setAnimation(this.run.bind(this), this.canvas);
            this.running = !0
        },
        clear: function(b) {
            this.context.fillStyle = b;
            this.context.fillRect(0, 0, this.realWidth, this.realHeight)
        },
        run: function() {
            ig.Timer.step();
            this.tick = this.clock.tick();
            this.delegate.run();
            ig.input.clearPressed();
            this.newGameClass && (this.setGameNow(this.newGameClass), this.newGameClass = null)
        },
        getDrawPos: null
    });
    ig.System.DRAW = {
        AUTHENTIC: function(b) {
            return Math.round(b) * this.scale
        },
        SMOOTH: function(b) {
            return Math.round(b * this.scale)
        },
        SUBPIXEL: function(b) {
            return b * this.scale
        }
    };
    ig.System.drawMode = ig.System.DRAW.SMOOTH;
    ig.System.SCALE = {
        CRISP: function(b, c) {
            ig.setVendorAttribute(c, "imageSmoothingEnabled", !1);
            b.style.imageRendering = "-moz-crisp-edges";
            b.style.imageRendering = "-o-crisp-edges";
            b.style.imageRendering = "-webkit-optimize-contrast";
            b.style.imageRendering = "crisp-edges";
            b.style.msInterpolationMode = "nearest-neighbor"
        },
        SMOOTH: function(b, c) {
            ig.setVendorAttribute(c, "imageSmoothingEnabled", !0);
            b.style.imageRendering = "";
            b.style.msInterpolationMode = ""
        }
    };
    ig.System.scaleMode = ig.System.SCALE.SMOOTH
});
ig.baked = !0;
ig.module("impact.input").defines(function() {
    ig.KEY = {
        MOUSE1: -1,
        MOUSE2: -3,
        MWHEEL_UP: -4,
        MWHEEL_DOWN: -5,
        BACKSPACE: 8,
        TAB: 9,
        ENTER: 13,
        PAUSE: 19,
        CAPS: 20,
        ESC: 27,
        SPACE: 32,
        PAGE_UP: 33,
        PAGE_DOWN: 34,
        END: 35,
        HOME: 36,
        LEFT_ARROW: 37,
        UP_ARROW: 38,
        RIGHT_ARROW: 39,
        DOWN_ARROW: 40,
        INSERT: 45,
        DELETE: 46,
        _0: 48,
        _1: 49,
        _2: 50,
        _3: 51,
        _4: 52,
        _5: 53,
        _6: 54,
        _7: 55,
        _8: 56,
        _9: 57,
        A: 65,
        B: 66,
        C: 67,
        D: 68,
        E: 69,
        F: 70,
        G: 71,
        H: 72,
        I: 73,
        J: 74,
        K: 75,
        L: 76,
        M: 77,
        N: 78,
        O: 79,
        P: 80,
        Q: 81,
        R: 82,
        S: 83,
        T: 84,
        U: 85,
        V: 86,
        W: 87,
        X: 88,
        Y: 89,
        Z: 90,
        NUMPAD_0: 96,
        NUMPAD_1: 97,
        NUMPAD_2: 98,
        NUMPAD_3: 99,
        NUMPAD_4: 100,
        NUMPAD_5: 101,
        NUMPAD_6: 102,
        NUMPAD_7: 103,
        NUMPAD_8: 104,
        NUMPAD_9: 105,
        MULTIPLY: 106,
        ADD: 107,
        SUBSTRACT: 109,
        DECIMAL: 110,
        DIVIDE: 111,
        F1: 112,
        F2: 113,
        F3: 114,
        F4: 115,
        F5: 116,
        F6: 117,
        F7: 118,
        F8: 119,
        F9: 120,
        F10: 121,
        F11: 122,
        F12: 123,
        SHIFT: 16,
        CTRL: 17,
        ALT: 18,
        PLUS: 187,
        COMMA: 188,
        MINUS: 189,
        PERIOD: 190
    };
    ig.Input = ig.Class.extend({
        bindings: {},
        actions: {},
        presses: {},
        locks: {},
        delayedKeyup: {},
        isUsingMouse: !1,
        isUsingKeyboard: !1,
        isUsingAccelerometer: !1,
        mouse: {
            x: 0,
            y: 0
        },
        accel: {
            x: 0,
            y: 0,
            z: 0
        },
        initMouse: function() {
            if (!this.isUsingMouse) {
                this.isUsingMouse = !0;
                var b = this.mousewheel.bind(this);
                ig.system.canvas.addEventListener("mousewheel", b, !1);
                ig.system.canvas.addEventListener("DOMMouseScroll", b, !1);
                ig.system.canvas.addEventListener("contextmenu", this.contextmenu.bind(this), !1);
                ig.system.canvas.addEventListener("mousedown", this.keydown.bind(this), !1);
                ig.system.canvas.addEventListener("mouseup", this.keyup.bind(this), !1);
                ig.system.canvas.addEventListener("mousemove", this.mousemove.bind(this), !1);
                ig.ua.touchDevice && (ig.system.canvas.addEventListener("touchstart",
                    this.keydown.bind(this), !1), ig.system.canvas.addEventListener("touchend", this.keyup.bind(this), !1), ig.system.canvas.addEventListener("touchmove", this.mousemove.bind(this), !1), ig.system.canvas.addEventListener("MSPointerDown", this.keydown.bind(this), !1), ig.system.canvas.addEventListener("MSPointerUp", this.keyup.bind(this), !1), ig.system.canvas.addEventListener("MSPointerMove", this.mousemove.bind(this), !1), ig.system.canvas.style.msTouchAction = "none")
            }
        },
        initKeyboard: function() {
            this.isUsingKeyboard || (this.isUsingKeyboard = !0, window.addEventListener("keydown", this.keydown.bind(this), !1), window.addEventListener("keyup", this.keyup.bind(this), !1))
        },
        initAccelerometer: function() {
            this.isUsingAccelerometer || window.addEventListener("devicemotion", this.devicemotion.bind(this), !1)
        },
        mousewheel: function(b) {
            var c = this.bindings[0 < (b.wheelDelta ? b.wheelDelta : -1 * b.detail) ? ig.KEY.MWHEEL_UP : ig.KEY.MWHEEL_DOWN];
            c && (this.actions[c] = !0, this.presses[c] = !0, this.delayedKeyup[c] = !0, b.stopPropagation(), b.preventDefault())
        },
        mousemove: function(b) {
            var c =
                parseInt(ig.system.canvas.offsetWidth) || ig.system.realWidth;
            ig.ua.mobile && (c = ig.system.realWidth);
            var c = ig.system.scale * (c / ig.system.realWidth),
                d = {
                    left: 0,
                    top: 0
                };
            ig.system.canvas.getBoundingClientRect && (d = ig.system.canvas.getBoundingClientRect());
            b = b.touches ? b.touches[0] : b;
            this.mouse.x = (b.clientX - d.left) / c;
            this.mouse.y = (b.clientY - d.top) / c
        },
        contextmenu: function(b) {
            this.bindings[ig.KEY.MOUSE2] && (b.stopPropagation(), b.preventDefault())
        },
        keydown: function(b) {
            var c = b.target.tagName;
            if (!("INPUT" == c || "TEXTAREA" ==
                c))
                if (c = "keydown" == b.type ? b.keyCode : 2 == b.button ? ig.KEY.MOUSE2 : ig.KEY.MOUSE1, ("touchstart" == b.type || "mousedown" == b.type) && this.mousemove(b), c = this.bindings[c]) this.actions[c] = !0, this.locks[c] || (this.presses[c] = !0, this.locks[c] = !0), b.stopPropagation(), b.preventDefault()
        },
        keyup: function(b) {
            var c = b.target.tagName;
            if (!("INPUT" == c || "TEXTAREA" == c))
                if (c = this.bindings["keyup" == b.type ? b.keyCode : 2 == b.button ? ig.KEY.MOUSE2 : ig.KEY.MOUSE1]) this.delayedKeyup[c] = !0, b.stopPropagation(), b.preventDefault()
        },
        devicemotion: function(b) {
            this.accel =
                b.accelerationIncludingGravity
        },
        bind: function(b, c) {
            0 > b ? this.initMouse() : 0 < b && this.initKeyboard();
            this.bindings[b] = c
        },
        bindTouch: function(b, c) {
            var d = ig.$(b),
                e = this;
            d.addEventListener("touchstart", function(b) {
                e.touchStart(b, c)
            }, !1);
            d.addEventListener("touchend", function(b) {
                e.touchEnd(b, c)
            }, !1);
            d.addEventListener("MSPointerDown", function(b) {
                e.touchStart(b, c)
            }, !1);
            d.addEventListener("MSPointerUp", function(b) {
                e.touchEnd(b, c)
            }, !1)
        },
        unbind: function(b) {
            this.delayedKeyup[this.bindings[b]] = !0;
            this.bindings[b] =
                null
        },
        unbindAll: function() {
            this.bindings = {};
            this.actions = {};
            this.presses = {};
            this.locks = {};
            this.delayedKeyup = {}
        },
        state: function(b) {
            return this.actions[b]
        },
        pressed: function(b) {
            return this.presses[b]
        },
        released: function(b) {
            return !!this.delayedKeyup[b]
        },
        clearPressed: function() {
            for (var b in this.delayedKeyup) this.actions[b] = !1, this.locks[b] = !1;
            this.delayedKeyup = {};
            this.presses = {}
        },
        touchStart: function(b, c) {
            this.actions[c] = !0;
            this.presses[c] = !0;
            b.stopPropagation();
            b.preventDefault();
            return !1
        },
        touchEnd: function(b,
            c) {
            this.delayedKeyup[c] = !0;
            b.stopPropagation();
            b.preventDefault();
            return !1
        }
    })
});
ig.baked = !0;
ig.module("impact.impact").requires("dom.ready", "impact.loader", "impact.system", "impact.input", "impact.sound").defines(function() {
    ig.main = function(b, c, d, e, f, j, t) {
        ig.system = new ig.System(b, d, e, f, j || 1);
        ig.input = new ig.Input;
        ig.soundManager = new ig.SoundManager;
        ig.music = new ig.Music;
        ig.ready = !0;
        (new(t || ig.Loader)(c, ig.resources)).load()
    }
});
ig.baked = !0;
ig.module("impact.animation").requires("impact.timer", "impact.image").defines(function() {
    ig.AnimationSheet = ig.Class.extend({
        width: 8,
        height: 8,
        image: null,
        init: function(b, c, d) {
            this.width = c;
            this.height = d;
            this.image = new ig.Image(b)
        }
    });
    ig.Animation = ig.Class.extend({
        sheet: null,
        timer: null,
        sequence: [],
        flip: {
            x: !1,
            y: !1
        },
        pivot: {
            x: 0,
            y: 0
        },
        frame: 0,
        tile: 0,
        loopCount: 0,
        alpha: 1,
        angle: 0,
        init: function(b, c, d, e) {
            this.sheet = b;
            this.pivot = {
                x: b.width / 2,
                y: b.height / 2
            };
            this.timer = new ig.Timer;
            this.frameTime = c;
            this.sequence = d;
            this.stop = !!e;
            this.tile = this.sequence[0]
        },
        rewind: function() {
            this.timer.set();
            this.frame = this.loopCount = 0;
            this.tile = this.sequence[0];
            return this
        },
        gotoFrame: function(b) {
            this.timer.set(this.frameTime * -b - 1E-4);
            this.update()
        },
        gotoRandomFrame: function() {
            this.gotoFrame(Math.floor(Math.random() * this.sequence.length))
        },
        update: function() {
            var b = Math.floor(this.timer.delta() / this.frameTime);
            this.loopCount = Math.floor(b / this.sequence.length);
            this.frame = this.stop && 0 < this.loopCount ? this.sequence.length - 1 : b % this.sequence.length;
            this.tile = this.sequence[this.frame]
        },
        draw: function(b, c) {
            var d = Math.max(this.sheet.width, this.sheet.height);
            b > ig.system.width || c > ig.system.height || (0 > b + d || 0 > c + d) || (1 != this.alpha && (ig.system.context.globalAlpha = this.alpha), 0 == this.angle ? this.sheet.image.drawTile(b, c, this.tile, this.sheet.width, this.sheet.height, this.flip.x, this.flip.y) : (ig.system.context.save(), ig.system.context.translate(ig.system.getDrawPos(b + this.pivot.x), ig.system.getDrawPos(c + this.pivot.y)), ig.system.context.rotate(this.angle),
                this.sheet.image.drawTile(-this.pivot.x, -this.pivot.y, this.tile, this.sheet.width, this.sheet.height, this.flip.x, this.flip.y), ig.system.context.restore()), 1 != this.alpha && (ig.system.context.globalAlpha = 1))
        }
    })
});
ig.baked = !0;
ig.module("impact.entity").requires("impact.animation", "impact.impact").defines(function() {
    ig.Entity = ig.Class.extend({
        id: 0,
        settings: {},
        size: {
            x: 16,
            y: 16
        },
        offset: {
            x: 0,
            y: 0
        },
        pos: {
            x: 0,
            y: 0
        },
        last: {
            x: 0,
            y: 0
        },
        vel: {
            x: 0,
            y: 0
        },
        accel: {
            x: 0,
            y: 0
        },
        friction: {
            x: 0,
            y: 0
        },
        maxVel: {
            x: 100,
            y: 100
        },
        zIndex: 0,
        gravityFactor: 1,
        standing: !1,
        bounciness: 0,
        minBounceVelocity: 40,
        anims: {},
        animSheet: null,
        currentAnim: null,
        health: 10,
        type: 0,
        checkAgainst: 0,
        collides: 0,
        _killed: !1,
        slopeStanding: {
            min: (44).toRad(),
            max: (136).toRad()
        },
        init: function(b,
            c, d) {
            this.id = ++ig.Entity._lastId;
            this.pos.x = this.last.x = b;
            this.pos.y = this.last.y = c;
            ig.merge(this, d)
        },
        reset: function(b, c, d) {
            var e = this.constructor.prototype;
            this.pos.x = b;
            this.pos.y = c;
            this.last.x = b;
            this.last.y = c;
            this.vel.x = e.vel.x;
            this.vel.y = e.vel.y;
            this.accel.x = e.accel.x;
            this.accel.y = e.accel.y;
            this.health = e.health;
            this._killed = e._killed;
            this.standing = e.standing;
            this.type = e.type;
            this.checkAgainst = e.checkAgainst;
            this.collides = e.collides;
            ig.merge(this, d)
        },
        addAnim: function(b, c, d, e) {
            if (!this.animSheet) throw "No animSheet to add the animation " +
                b + " to.";
            c = new ig.Animation(this.animSheet, c, d, e);
            this.anims[b] = c;
            this.currentAnim || (this.currentAnim = c);
            return c
        },
        update: function() {
            this.last.x = this.pos.x;
            this.last.y = this.pos.y;
            this.vel.y += ig.game.gravity * ig.system.tick * this.gravityFactor;
            this.vel.x = this.getNewVelocity(this.vel.x, this.accel.x, this.friction.x, this.maxVel.x);
            this.vel.y = this.getNewVelocity(this.vel.y, this.accel.y, this.friction.y, this.maxVel.y);
            var b = ig.game.collisionMap.trace(this.pos.x, this.pos.y, this.vel.x * ig.system.tick, this.vel.y *
                ig.system.tick, this.size.x, this.size.y);
            this.handleMovementTrace(b);
            this.currentAnim && this.currentAnim.update()
        },
        getNewVelocity: function(b, c, d, e) {
            return c ? (b + c * ig.system.tick).limit(-e, e) : d ? (c = d * ig.system.tick, 0 < b - c ? b - c : 0 > b + c ? b + c : 0) : b.limit(-e, e)
        },
        handleMovementTrace: function(b) {
            this.standing = !1;
            b.collision.y && (0 < this.bounciness && Math.abs(this.vel.y) > this.minBounceVelocity ? this.vel.y *= -this.bounciness : (0 < this.vel.y && (this.standing = !0), this.vel.y = 0));
            b.collision.x && (this.vel.x = 0 < this.bounciness && Math.abs(this.vel.x) >
                this.minBounceVelocity ? this.vel.x * -this.bounciness : 0);
            if (b.collision.slope) {
                var c = b.collision.slope;
                if (0 < this.bounciness) {
                    var d = this.vel.x * c.nx + this.vel.y * c.ny;
                    this.vel.x = (this.vel.x - 2 * c.nx * d) * this.bounciness;
                    this.vel.y = (this.vel.y - 2 * c.ny * d) * this.bounciness
                } else d = (this.vel.x * c.x + this.vel.y * c.y) / (c.x * c.x + c.y * c.y), this.vel.x = c.x * d, this.vel.y = c.y * d, c = Math.atan2(c.x, c.y), c > this.slopeStanding.min && c < this.slopeStanding.max && (this.standing = !0)
            }
            this.pos = b.pos
        },
        draw: function() {
            this.currentAnim && this.currentAnim.draw(this.pos.x -
                this.offset.x - ig.game._rscreen.x, this.pos.y - this.offset.y - ig.game._rscreen.y)
        },
        kill: function() {
            ig.game.removeEntity(this)
        },
        receiveDamage: function(b) {
            this.health -= b;
            0 >= this.health && this.kill()
        },
        touches: function(b) {
            return !(this.pos.x >= b.pos.x + b.size.x || this.pos.x + this.size.x <= b.pos.x || this.pos.y >= b.pos.y + b.size.y || this.pos.y + this.size.y <= b.pos.y)
        },
        distanceTo: function(b) {
            var c = this.pos.x + this.size.x / 2 - (b.pos.x + b.size.x / 2);
            b = this.pos.y + this.size.y / 2 - (b.pos.y + b.size.y / 2);
            return Math.sqrt(c * c + b * b)
        },
        angleTo: function(b) {
            return Math.atan2(b.pos.y +
                b.size.y / 2 - (this.pos.y + this.size.y / 2), b.pos.x + b.size.x / 2 - (this.pos.x + this.size.x / 2))
        },
        check: function() {},
        collideWith: function() {},
        ready: function() {},
        erase: function() {}
    });
    ig.Entity._lastId = 0;
    ig.Entity.COLLIDES = {
        NEVER: 0,
        LITE: 1,
        PASSIVE: 2,
        ACTIVE: 4,
        FIXED: 8
    };
    ig.Entity.TYPE = {
        NONE: 0,
        A: 1,
        B: 2,
        BOTH: 3
    };
    ig.Entity.checkPair = function(b, c) {
        b.checkAgainst & c.type && b.check(c);
        c.checkAgainst & b.type && c.check(b);
        b.collides && c.collides && b.collides + c.collides > ig.Entity.COLLIDES.ACTIVE && ig.Entity.solveCollision(b, c)
    };
    ig.Entity.solveCollision =
        function(b, c) {
            var d = null;
            if (b.collides == ig.Entity.COLLIDES.LITE || c.collides == ig.Entity.COLLIDES.FIXED) d = b;
            else if (c.collides == ig.Entity.COLLIDES.LITE || b.collides == ig.Entity.COLLIDES.FIXED) d = c;
            b.last.x + b.size.x > c.last.x && b.last.x < c.last.x + c.size.x ? (b.last.y < c.last.y ? ig.Entity.seperateOnYAxis(b, c, d) : ig.Entity.seperateOnYAxis(c, b, d), b.collideWith(c, "y"), c.collideWith(b, "y")) : b.last.y + b.size.y > c.last.y && b.last.y < c.last.y + c.size.y && (b.last.x < c.last.x ? ig.Entity.seperateOnXAxis(b, c, d) : ig.Entity.seperateOnXAxis(c,
                b, d), b.collideWith(c, "x"), c.collideWith(b, "x"))
        };
    ig.Entity.seperateOnXAxis = function(b, c, d) {
        var e = b.pos.x + b.size.x - c.pos.x;
        d ? (d.vel.x = -d.vel.x * d.bounciness + (b === d ? c : b).vel.x, c = ig.game.collisionMap.trace(d.pos.x, d.pos.y, d == b ? -e : e, 0, d.size.x, d.size.y), d.pos.x = c.pos.x) : (d = (b.vel.x - c.vel.x) / 2, b.vel.x = -d, c.vel.x = d, d = ig.game.collisionMap.trace(b.pos.x, b.pos.y, -e / 2, 0, b.size.x, b.size.y), b.pos.x = Math.floor(d.pos.x), b = ig.game.collisionMap.trace(c.pos.x, c.pos.y, e / 2, 0, c.size.x, c.size.y), c.pos.x = Math.ceil(b.pos.x))
    };
    ig.Entity.seperateOnYAxis = function(b, c, d) {
        var e = b.pos.y + b.size.y - c.pos.y;
        if (d) {
            c = b === d ? c : b;
            d.vel.y = -d.vel.y * d.bounciness + c.vel.y;
            var f = 0;
            d == b && Math.abs(d.vel.y - c.vel.y) < d.minBounceVelocity && (d.standing = !0, f = c.vel.x * ig.system.tick);
            b = ig.game.collisionMap.trace(d.pos.x, d.pos.y, f, d == b ? -e : e, d.size.x, d.size.y);
            d.pos.y = b.pos.y;
            d.pos.x = b.pos.x
        } else ig.game.gravity && (c.standing || 0 < b.vel.y) ? (d = ig.game.collisionMap.trace(b.pos.x, b.pos.y, 0, -(b.pos.y + b.size.y - c.pos.y), b.size.x, b.size.y), b.pos.y = d.pos.y, 0 < b.bounciness &&
            b.vel.y > b.minBounceVelocity ? b.vel.y *= -b.bounciness : (b.standing = !0, b.vel.y = 0)) : (d = (b.vel.y - c.vel.y) / 2, b.vel.y = -d, c.vel.y = d, f = c.vel.x * ig.system.tick, d = ig.game.collisionMap.trace(b.pos.x, b.pos.y, f, -e / 2, b.size.x, b.size.y), b.pos.y = d.pos.y, b = ig.game.collisionMap.trace(c.pos.x, c.pos.y, 0, e / 2, c.size.x, c.size.y), c.pos.y = b.pos.y)
    }
});
ig.baked = !0;
ig.module("impact.map").defines(function() {
    ig.Map = ig.Class.extend({
        tilesize: 8,
        width: 1,
        height: 1,
        data: [
            []
        ],
        name: null,
        init: function(b, c) {
            this.tilesize = b;
            this.data = c;
            this.height = c.length;
            this.width = c[0].length;
            this.pxWidth = this.width * this.tilesize;
            this.pxHeight = this.height * this.tilesize
        },
        getTile: function(b, c) {
            var d = Math.floor(b / this.tilesize),
                e = Math.floor(c / this.tilesize);
            return 0 <= d && d < this.width && 0 <= e && e < this.height ? this.data[e][d] : 0
        },
        setTile: function(b, c, d) {
            b = Math.floor(b / this.tilesize);
            c = Math.floor(c /
                this.tilesize);
            0 <= b && b < this.width && 0 <= c && c < this.height && (this.data[c][b] = d)
        }
    })
});
ig.baked = !0;
ig.module("impact.collision-map").requires("impact.map").defines(function() {
    ig.CollisionMap = ig.Map.extend({
        lastSlope: 1,
        tiledef: null,
        init: function(b, c, f) {
            this.parent(b, c);
            this.tiledef = f || ig.CollisionMap.defaultTileDef;
            for (var j in this.tiledef) j | 0 > this.lastSlope && (this.lastSlope = j | 0)
        },
        trace: function(b, c, f, j, t, m) {
            var r = {
                    collision: {
                        x: !1,
                        y: !1,
                        slope: !1
                    },
                    pos: {
                        x: b,
                        y: c
                    },
                    tile: {
                        x: 0,
                        y: 0
                    }
                },
                x = Math.ceil(Math.max(Math.abs(f), Math.abs(j)) / this.tilesize);
            if (1 < x)
                for (var A = f / x, s = j / x, C = 0; C < x && (A || s) && !(this._traceStep(r,
                    b, c, A, s, t, m, f, j, C), b = r.pos.x, c = r.pos.y, r.collision.x && (f = A = 0), r.collision.y && (j = s = 0), r.collision.slope); C++);
            else this._traceStep(r, b, c, f, j, t, m, f, j, 0);
            return r
        },
        _traceStep: function(b, c, f, j, t, m, r, x, A, s) {
            b.pos.x += j;
            b.pos.y += t;
            var C = 0;
            if (j) {
                var E = 0 < j ? m : 0,
                    n = 0 > j ? this.tilesize : 0,
                    C = Math.max(Math.floor(f / this.tilesize), 0),
                    u = Math.min(Math.ceil((f + r) / this.tilesize), this.height);
                j = Math.floor((b.pos.x + E) / this.tilesize);
                var y = Math.floor((c + E) / this.tilesize);
                if (0 < s || j == y || 0 > y || y >= this.width) y = -1;
                if (0 <= j && j < this.width)
                    for (var M =
                        C; M < u && !(-1 != y && (C = this.data[M][y], 1 < C && C <= this.lastSlope && this._checkTileDef(b, C, c, f, x, A, m, r, y, M))); M++)
                        if (C = this.data[M][j], 1 == C || C > this.lastSlope || 1 < C && this._checkTileDef(b, C, c, f, x, A, m, r, j, M)) {
                            if (1 < C && C <= this.lastSlope && b.collision.slope) break;
                            b.collision.x = !0;
                            b.tile.x = C;
                            c = b.pos.x = j * this.tilesize - E + n;
                            x = 0;
                            break
                        }
            }
            if (t) {
                E = 0 < t ? r : 0;
                t = 0 > t ? this.tilesize : 0;
                C = Math.max(Math.floor(b.pos.x / this.tilesize), 0);
                n = Math.min(Math.ceil((b.pos.x + m) / this.tilesize), this.width);
                M = Math.floor((b.pos.y + E) / this.tilesize);
                u = Math.floor((f + E) / this.tilesize);
                if (0 < s || M == u || 0 > u || u >= this.height) u = -1;
                if (0 <= M && M < this.height)
                    for (j = C; j < n && !(-1 != u && (C = this.data[u][j], 1 < C && C <= this.lastSlope && this._checkTileDef(b, C, c, f, x, A, m, r, j, u))); j++)
                        if (C = this.data[M][j], 1 == C || C > this.lastSlope || 1 < C && this._checkTileDef(b, C, c, f, x, A, m, r, j, M)) {
                            if (1 < C && C <= this.lastSlope && b.collision.slope) break;
                            b.collision.y = !0;
                            b.tile.y = C;
                            b.pos.y = M * this.tilesize - E + t;
                            break
                        }
            }
        },
        _checkTileDef: function(b, c, f, j, t, m, r, x, A, s) {
            var C = this.tiledef[c];
            if (!C) return !1;
            c = (C[2] -
                C[0]) * this.tilesize;
            var E = (C[3] - C[1]) * this.tilesize,
                n = C[4];
            r = f + t + (0 > E ? r : 0) - (A + C[0]) * this.tilesize;
            x = j + m + (0 < c ? x : 0) - (s + C[1]) * this.tilesize;
            if (0 < c * x - E * r) {
                if (0 > t * -E + m * c) return n;
                A = Math.sqrt(c * c + E * E);
                s = E / A;
                A = -c / A;
                var u = r * s + x * A,
                    C = s * u,
                    u = A * u;
                if (C * C + u * u >= t * t + m * m) return n || 0.5 > c * (x - m) - E * (r - t);
                b.pos.x = f + t - C;
                b.pos.y = j + m - u;
                b.collision.slope = {
                    x: c,
                    y: E,
                    nx: s,
                    ny: A
                };
                return !0
            }
            return !1
        }
    });
    var b = 1 / 3,
        c = 2 / 3;
    ig.CollisionMap.defaultTileDef = {
        5: [0, 1, 1, c, !0],
        6: [0, c, 1, b, !0],
        7: [0, b, 1, 0, !0],
        3: [0, 1, 1, 0.5, !0],
        4: [0, 0.5, 1, 0, !0],
        2: [0,
            1, 1, 0, !0
        ],
        10: [0.5, 1, 1, 0, !0],
        21: [0, 1, 0.5, 0, !0],
        32: [c, 1, 1, 0, !0],
        43: [b, 1, c, 0, !0],
        54: [0, 1, b, 0, !0],
        27: [0, 0, 1, b, !0],
        28: [0, b, 1, c, !0],
        29: [0, c, 1, 1, !0],
        25: [0, 0, 1, 0.5, !0],
        26: [0, 0.5, 1, 1, !0],
        24: [0, 0, 1, 1, !0],
        11: [0, 0, 0.5, 1, !0],
        22: [0.5, 0, 1, 1, !0],
        33: [0, 0, b, 1, !0],
        44: [b, 0, c, 1, !0],
        55: [c, 0, 1, 1, !0],
        16: [1, b, 0, 0, !0],
        17: [1, c, 0, b, !0],
        18: [1, 1, 0, c, !0],
        14: [1, 0.5, 0, 0, !0],
        15: [1, 1, 0, 0.5, !0],
        13: [1, 1, 0, 0, !0],
        8: [0.5, 1, 0, 0, !0],
        19: [1, 1, 0.5, 0, !0],
        30: [b, 1, 0, 0, !0],
        41: [c, 1, b, 0, !0],
        52: [1, 1, c, 0, !0],
        38: [1, c, 0, 1, !0],
        39: [1, b, 0, c, !0],
        40: [1, 0,
            0, b, !0
        ],
        36: [1, 0.5, 0, 1, !0],
        37: [1, 0, 0, 0.5, !0],
        35: [1, 0, 0, 1, !0],
        9: [1, 0, 0.5, 1, !0],
        20: [0.5, 0, 0, 1, !0],
        31: [1, 0, c, 1, !0],
        42: [c, 0, b, 1, !0],
        53: [b, 0, 0, 1, !0],
        12: [0, 0, 1, 0, !1],
        23: [1, 1, 0, 1, !1],
        34: [1, 0, 1, 1, !1],
        45: [0, 1, 0, 0, !1]
    };
    ig.CollisionMap.staticNoCollision = {
        trace: function(b, c, f, j) {
            return {
                collision: {
                    x: !1,
                    y: !1,
                    slope: !1
                },
                pos: {
                    x: b + f,
                    y: c + j
                },
                tile: {
                    x: 0,
                    y: 0
                }
            }
        }
    }
});
ig.baked = !0;
ig.module("impact.background-map").requires("impact.map", "impact.image").defines(function() {
    ig.BackgroundMap = ig.Map.extend({
        tiles: null,
        scroll: {
            x: 0,
            y: 0
        },
        distance: 1,
        repeat: !1,
        tilesetName: "",
        foreground: !1,
        enabled: !0,
        preRender: !1,
        preRenderedChunks: null,
        chunkSize: 512,
        debugChunks: !1,
        anims: {},
        init: function(b, c, d) {
            this.parent(b, c);
            this.setTileset(d)
        },
        setTileset: function(b) {
            this.tilesetName = b instanceof ig.Image ? b.path : b;
            this.tiles = new ig.Image(this.tilesetName);
            this.preRenderedChunks = null
        },
        setScreenPos: function(b,
            c) {
            this.scroll.x = b / this.distance;
            this.scroll.y = c / this.distance
        },
        preRenderMapToChunks: function() {
            var b = this.width * this.tilesize * ig.system.scale,
                c = this.height * this.tilesize * ig.system.scale;
            this.chunkSize = Math.min(Math.max(b, c), this.chunkSize);
            var d = Math.ceil(b / this.chunkSize),
                e = Math.ceil(c / this.chunkSize);
            this.preRenderedChunks = [];
            for (var f = 0; f < e; f++) {
                this.preRenderedChunks[f] = [];
                for (var j = 0; j < d; j++) this.preRenderedChunks[f][j] = this.preRenderChunk(j, f, j == d - 1 ? b - j * this.chunkSize : this.chunkSize, f == e - 1 ?
                    c - f * this.chunkSize : this.chunkSize)
            }
        },
        preRenderChunk: function(b, c, d, e) {
            var f = d / this.tilesize / ig.system.scale + 1,
                j = e / this.tilesize / ig.system.scale + 1,
                t = b * this.chunkSize / ig.system.scale % this.tilesize,
                m = c * this.chunkSize / ig.system.scale % this.tilesize;
            b = Math.floor(b * this.chunkSize / this.tilesize / ig.system.scale);
            c = Math.floor(c * this.chunkSize / this.tilesize / ig.system.scale);
            var r = ig.$new("canvas");
            r.width = d;
            r.height = e;
            r.retinaResolutionEnabled = !1;
            e = r.getContext("2d");
            ig.System.scaleMode(r, e);
            d = ig.system.context;
            ig.system.context = e;
            for (e = 0; e < f; e++)
                for (var x = 0; x < j; x++)
                    if (e + b < this.width && x + c < this.height) {
                        var A = this.data[x + c][e + b];
                        A && this.tiles.drawTile(e * this.tilesize - t, x * this.tilesize - m, A - 1, this.tilesize)
                    }
            ig.system.context = d;
            return r
        },
        draw: function() {
            this.tiles.loaded && this.enabled && (this.preRender ? this.drawPreRendered() : this.drawTiled())
        },
        drawPreRendered: function() {
            this.preRenderedChunks || this.preRenderMapToChunks();
            var b = ig.system.getDrawPos(this.scroll.x),
                c = ig.system.getDrawPos(this.scroll.y);
            if (this.repeat) var d =
                this.width * this.tilesize * ig.system.scale,
                b = (b % d + d) % d,
                d = this.height * this.tilesize * ig.system.scale,
                c = (c % d + d) % d;
            var d = Math.max(Math.floor(b / this.chunkSize), 0),
                e = Math.max(Math.floor(c / this.chunkSize), 0),
                f = Math.ceil((b + ig.system.realWidth) / this.chunkSize),
                j = Math.ceil((c + ig.system.realHeight) / this.chunkSize),
                t = this.preRenderedChunks[0].length,
                m = this.preRenderedChunks.length;
            this.repeat || (f = Math.min(f, t), j = Math.min(j, m));
            for (var r = 0; e < j; e++) {
                for (var x = 0, A = d; A < f; A++) {
                    var s = this.preRenderedChunks[e % m][A % t],
                        C = -b + A * this.chunkSize - x,
                        E = -c + e * this.chunkSize - r;
                    ig.system.context.drawImage(s, C, E);
                    ig.Image.drawCount++;
                    this.debugChunks && (ig.system.context.strokeStyle = "#f0f", ig.system.context.strokeRect(C, E, this.chunkSize, this.chunkSize));
                    this.repeat && s.width < this.chunkSize && C + s.width < ig.system.realWidth && (x += this.chunkSize - s.width, f++)
                }
                this.repeat && s.height < this.chunkSize && E + s.height < ig.system.realHeight && (r += this.chunkSize - s.height, j++)
            }
        },
        drawTiled: function() {
            for (var b = 0, c = null, d = (this.scroll.x / this.tilesize).toInt(),
                e = (this.scroll.y / this.tilesize).toInt(), f = this.scroll.x % this.tilesize, j = this.scroll.y % this.tilesize, t = -f - this.tilesize, f = ig.system.width + this.tilesize - f, m = ig.system.height + this.tilesize - j, r = -1, j = -j - this.tilesize; j < m; r++, j += this.tilesize) {
                var x = r + e;
                if (x >= this.height || 0 > x) {
                    if (!this.repeat) continue;
                    x = (x % this.height + this.height) % this.height
                }
                for (var A = -1, s = t; s < f; A++, s += this.tilesize) {
                    b = A + d;
                    if (b >= this.width || 0 > b) {
                        if (!this.repeat) continue;
                        b = (b % this.width + this.width) % this.width
                    }
                    if (b = this.data[x][b])(c = this.anims[b -
                        1]) ? c.draw(s, j) : this.tiles.drawTile(s, j, b - 1, this.tilesize)
                }
            }
        }
    })
});
ig.baked = !0;
ig.module("impact.game").requires("impact.impact", "impact.entity", "impact.collision-map", "impact.background-map").defines(function() {
    ig.Game = ig.Class.extend({
        clearColor: "#000000",
        gravity: 0,
        screen: {
            x: 0,
            y: 0
        },
        _rscreen: {
            x: 0,
            y: 0
        },
        entities: [],
        namedEntities: {},
        collisionMap: ig.CollisionMap.staticNoCollision,
        backgroundMaps: [],
        backgroundAnims: {},
        autoSort: !1,
        sortBy: null,
        cellSize: 64,
        _deferredKill: [],
        _levelToLoad: null,
        _doSortEntities: !1,
        staticInstantiate: function() {
            this.sortBy = this.sortBy || ig.Game.SORT.Z_INDEX;
            ig.game = this;
            return null
        },
        loadLevel: function(b) {
            this.screen = {
                x: 0,
                y: 0
            };
            this.entities = [];
            this.namedEntities = {};
            for (var c = 0; c < b.entities.length; c++) {
                var d = b.entities[c];
                this.spawnEntity(d.type, d.x, d.y, d.settings)
            }
            this.sortEntities();
            this.collisionMap = ig.CollisionMap.staticNoCollision;
            this.backgroundMaps = [];
            for (c = 0; c < b.layer.length; c++)
                if (d = b.layer[c], "collision" == d.name) this.collisionMap = new ig.CollisionMap(d.tilesize, d.data);
                else {
                    var e = new ig.BackgroundMap(d.tilesize, d.data, d.tilesetName);
                    e.anims = this.backgroundAnims[d.tilesetName] || {};
                    e.repeat = d.repeat;
                    e.distance = d.distance;
                    e.foreground = !!d.foreground;
                    e.preRender = !!d.preRender;
                    e.name = d.name;
                    this.backgroundMaps.push(e)
                }
            for (c = 0; c < this.entities.length; c++) this.entities[c].ready()
        },
        loadLevelDeferred: function(b) {
            this._levelToLoad = b
        },
        getMapByName: function(b) {
            if ("collision" == b) return this.collisionMap;
            for (var c = 0; c < this.backgroundMaps.length; c++)
                if (this.backgroundMaps[c].name == b) return this.backgroundMaps[c];
            return null
        },
        getEntityByName: function(b) {
            return this.namedEntities[b]
        },
        getEntitiesByType: function(b) {
            b =
                "string" === typeof b ? ig.global[b] : b;
            for (var c = [], d = 0; d < this.entities.length; d++) {
                var e = this.entities[d];
                e instanceof b && !e._killed && c.push(e)
            }
            return c
        },
        spawnEntity: function(b, c, d, e) {
            var f = "string" === typeof b ? ig.global[b] : b;
            if (!f) throw "Can't spawn entity of type " + b;
            b = new f(c, d, e || {});
            this.entities.push(b);
            b.name && (this.namedEntities[b.name] = b);
            return b
        },
        sortEntities: function() {
            this.entities.sort(this.sortBy)
        },
        sortEntitiesDeferred: function() {
            this._doSortEntities = !0
        },
        removeEntity: function(b) {
            b.name &&
                delete this.namedEntities[b.name];
            b._killed = !0;
            b.type = ig.Entity.TYPE.NONE;
            b.checkAgainst = ig.Entity.TYPE.NONE;
            b.collides = ig.Entity.COLLIDES.NEVER;
            this._deferredKill.push(b)
        },
        run: function() {
            this.update();
            this.draw()
        },
        update: function() {
            this._levelToLoad && (this.loadLevel(this._levelToLoad), this._levelToLoad = null);
            this.updateEntities();
            this.checkEntities();
            for (var b = 0; b < this._deferredKill.length; b++) this._deferredKill[b].erase(), this.entities.erase(this._deferredKill[b]);
            this._deferredKill = [];
            if (this._doSortEntities ||
                this.autoSort) this.sortEntities(), this._doSortEntities = !1;
            for (var c in this.backgroundAnims) {
                var b = this.backgroundAnims[c],
                    d;
                for (d in b) b[d].update()
            }
        },
        updateEntities: function() {
            for (var b = 0; b < this.entities.length; b++) {
                var c = this.entities[b];
                c._killed || c.update()
            }
        },
        draw: function() {
            this.clearColor && ig.system.clear(this.clearColor);
            this._rscreen.x = ig.system.getDrawPos(this.screen.x) / ig.system.scale;
            this._rscreen.y = ig.system.getDrawPos(this.screen.y) / ig.system.scale;
            var b;
            for (b = 0; b < this.backgroundMaps.length; b++) {
                var c =
                    this.backgroundMaps[b];
                if (c.foreground) break;
                c.setScreenPos(this.screen.x, this.screen.y);
                c.draw()
            }
            this.drawEntities();
            for (b; b < this.backgroundMaps.length; b++) c = this.backgroundMaps[b], c.setScreenPos(this.screen.x, this.screen.y), c.draw()
        },
        drawEntities: function() {
            for (var b = 0; b < this.entities.length; b++) this.entities[b].draw()
        },
        checkEntities: function() {
            for (var b = {}, c = 0; c < this.entities.length; c++) {
                var d = this.entities[c];
                if (!(d.type == ig.Entity.TYPE.NONE && d.checkAgainst == ig.Entity.TYPE.NONE && d.collides == ig.Entity.COLLIDES.NEVER))
                    for (var e = {}, f = Math.floor(d.pos.y / this.cellSize), j = Math.floor((d.pos.x + d.size.x) / this.cellSize) + 1, t = Math.floor((d.pos.y + d.size.y) / this.cellSize) + 1, m = Math.floor(d.pos.x / this.cellSize); m < j; m++)
                        for (var r = f; r < t; r++)
                            if (b[m])
                                if (b[m][r]) {
                                    for (var x = b[m][r], A = 0; A < x.length; A++) d.touches(x[A]) && !e[x[A].id] && (e[x[A].id] = !0, ig.Entity.checkPair(d, x[A]));
                                    x.push(d)
                                } else b[m][r] = [d];
                else b[m] = {}, b[m][r] = [d]
            }
        }
    });
    ig.Game.SORT = {
        Z_INDEX: function(b, c) {
            return b.zIndex - c.zIndex
        },
        POS_X: function(b, c) {
            return b.pos.x + b.size.x - (c.pos.x +
                c.size.x)
        },
        POS_Y: function(b, c) {
            return b.pos.y + b.size.y - (c.pos.y + c.size.y)
        }
    }
});
ig.baked = !0;
ig.module("plugins.patches.webkit-image-smoothing-patch").defines(function() {
    ig.System && (ig.System.SCALE = {
        CRISP: function(b, c) {
            c.imageSmoothingEnabled = c.msImageSmoothingEnabled = c.mozImageSmoothingEnabled = c.oImageSmoothingEnabled = !1;
            b.style.imageRendering = "-moz-crisp-edges";
            b.style.imageRendering = "-o-crisp-edges";
            b.style.imageRendering = "-webkit-optimize-contrast";
            b.style.imageRendering = "crisp-edges";
            b.style.msInterpolationMode = "nearest-neighbor"
        },
        SMOOTH: function(b, c) {
            c.imageSmoothingEnabled = c.msImageSmoothingEnabled =
                c.mozImageSmoothingEnabled = c.oImageSmoothingEnabled = !0;
            b.style.imageRendering = "";
            b.style.msInterpolationMode = ""
        }
    }, ig.System.scaleMode = ig.System.SCALE.SMOOTH)
});
ig.baked = !0;
ig.module("plugins.patches.windowfocus-onMouseDown-patch").defines(function() {
    var b = !1;
    try {
        b = window.self !== window.top, !1 === b && (b = 0 < window.frames.length)
    } catch (c) {
        b = !0
    }
    ig.Input.inject({
        keydown: function(c) {
            var e = c.target.tagName;
            if (!("INPUT" == e || "TEXTAREA" == e))
                if (e = "keydown" == c.type ? c.keyCode : 2 == c.button ? ig.KEY.MOUSE2 : ig.KEY.MOUSE1, b && 0 > e && window.focus(), ("touchstart" == c.type || "mousedown" == c.type) && this.mousemove(c), e = this.bindings[e]) this.actions[e] = !0, this.locks[e] || (this.presses[e] = !0, this.locks[e] = !0), c.stopPropagation(), c.preventDefault()
        }
    })
});
ig.baked = !0;
ig.module("plugins.handlers.dom-handler").defines(function() {
    ig.DomHandler = ig.Class.extend({
        JQUERYAVAILABLE: !1,
        init: function() {
            this.JQUERYAVAILABLE = this._jqueryAvailable()
        },
        _jqueryAvailable: function() {
            return "undefined" !== typeof jQuery
        },
        addEvent: function(b, c, d, e) {
            if (this.JQUERYAVAILABLE) b.on(c, d);
            else b.addEventListener(c, d, e)
        },
        create: function(b) {
            return this.JQUERYAVAILABLE ? $("<" + b + ">") : ig.$new(b)
        },
        getElementByClass: function(b) {
            return this.JQUERYAVAILABLE ? $("." + b) : document.getElementsByClassName(b)
        },
        getElementById: function(b) {
            return this.JQUERYAVAILABLE ? 0 < $(b).length ? $(b) : null : ig.$(b)
        },
        appendChild: function(b, c) {
            this.JQUERYAVAILABLE ? b.append(c) : b.appendChild(c)
        },
        appendToBody: function(b) {
            this.JQUERYAVAILABLE ? $("body").append(b) : document.body.appendChild(b)
        },
        resize: function(b, c, d) {
            if (this.JQUERYAVAILABLE) b.width(c.toFixed(2)), b.height(d.toFixed(2));
            else {
                var e = b.style.visibility;
                c = "width:" + c.toFixed(2) + "px; height:" + d.toFixed(2) + "px;";
                this.attr(b, "style", c);
                b.style.visibility = e
            }
        },
        resizeOffsetLeft: function(b,
            c, d, e) {
            if (this.JQUERYAVAILABLE) b.width(c.toFixed(2)), b.height(d.toFixed(2)), b.css("left", e);
            else {
                var f = b.style.visibility;
                c = "width:" + c.toFixed(2) + "px; height:" + d.toFixed(2) + "px; left: " + e.toFixed(2) + "px;";
                this.attr(b, "style", c);
                b.style.visibility = f
            }
        },
        css: function(b, c) {
            if (this.JQUERYAVAILABLE) b.css(c);
            else {
                var d = "",
                    e;
                for (e in c) d += e + ":" + c[e] + ";";
                this.attr(b, "style", d)
            }
        },
        getOffsets: function(b) {
            return this.JQUERYAVAILABLE ? (b = b.offset(), {
                left: b.left,
                top: b.top
            }) : {
                left: b.offsetLeft,
                top: b.offsetTop
            }
        },
        attr: function(b,
            c, d) {
            if ("undefined" === typeof d) return this.JQUERYAVAILABLE ? b.attr(c) : b.getAttribute(c);
            this.JQUERYAVAILABLE ? b.attr(c, d) : b.setAttribute(c, d)
        },
        show: function(b) {
            this.JQUERYAVAILABLE ? (b.show(), b.css("visibility", "visible")) : b && (b.style ? b.style.visibility = "visible" : b[0] && (b[0].style.visibility = "visible"))
        },
        hide: function(b) {
            this.JQUERYAVAILABLE ? (b.hide(), b.css("visibility", "hidden")) : b && (b.style ? b.style.visibility = "hidden" : b[0] && (b[0].style.visibility = "hidden"))
        },
        getQueryVariable: function(b) {
            for (var c =
                window.location.search.substring(1).split("&"), d = 0; d < c.length; d++) {
                var e = c[d].split("=");
                if (decodeURIComponent(e[0]) == b) return decodeURIComponent(e[1])
            }
        },
        forcedDeviceDetection: function() {
            var b = this.getQueryVariable("device");
            if (b) switch (b) {
                case "mobile":
                    console.log("serving mobile version ...");
                    ig.ua.mobile = !0;
                    break;
                case "desktop":
                    console.log("serving desktop version ...");
                    ig.ua.mobile = !1;
                    break;
                default:
                    console.log("serving universal version ...")
            } else console.log("serving universal version ...")
        },
        forcedDeviceRotation: function() {
            var b = this.getQueryVariable("force-rotate");
            if (b) switch (b) {
                case "portrait":
                    console.log("force rotate to portrait");
                    window.orientation = 0;
                    break;
                case "landscape":
                    console.log("force rotate to horizontal");
                    window.orientation = 90;
                    break;
                default:
                    alert("wrong command/type in param force-rotate. Defaulting value to portrait"), window.orientation = 0
            }
        }
    })
});
ig.baked = !0;
ig.module("plugins.data.vector").defines(function() {
    Vector2 = ig.Class.extend({
        x: null,
        y: null,
        valType: "number",
        init: function(b, c) {
            typeof b === this.valType && typeof c === this.valType && (this.x = b, this.y = c)
        },
        row: function(b) {
            typeof b === this.valType && (this.y = b);
            return this.y
        },
        col: function(b) {
            typeof b === this.valType && (this.x = b);
            return this.x
        }
    })
});
ig.baked = !0;
ig.module("plugins.handlers.size-handler").requires("plugins.data.vector").defines(function() {
    ig.SizeHandler = ig.Class.extend({
        portraitMode: !0,
        desktop: {
            actualSize: new Vector2(window.innerWidth, window.innerHeight),
            actualResolution: new Vector2(640, 480)
        },
        mobile: {
            actualSize: new Vector2(window.innerWidth, window.innerHeight),
            actualResolution: new Vector2(480, 640)
        },
        windowSize: new Vector2(window.innerWidth, window.innerHeight),
        scaleRatioMultiplier: new Vector2(1, 1),
        sizeRatio: new Vector2(1, 1),
        scale: 1,
        domHandler: null,
        dynamicClickableEntityDivs: {},
        coreDivsToResize: ["#canvas", "#play", "#orientate"],
        adsToResize: {
            
        },
        init: function(b) {
            this.domHandler = b;
            if ("undefined" === typeof b) throw "undefined Dom Handler for Size Handler";
            this.sizeCalcs();
            this.eventListenerSetup();
            this.samsungFix()
        },
        sizeCalcs: function() {
            this.windowSize = new Vector2(window.innerWidth,
                window.innerHeight);
            if (ig.ua.mobile) {
                this.mobile.actualSize = new Vector2(window.innerWidth, window.innerHeight);
                var b = new Vector2(this.mobile.actualResolution.x, this.mobile.actualResolution.y);
                this.scaleRatioMultiplier = new Vector2(this.mobile.actualSize.x / b.x, this.mobile.actualSize.y / b.y);
                var c = Math.min(this.scaleRatioMultiplier.x, this.scaleRatioMultiplier.y);
                this.mobile.actualSize.x = b.x * this.scaleRatioMultiplier.x;
                this.mobile.actualSize.y = b.y * this.scaleRatioMultiplier.y
            } else this.desktop.actualSize =
                new Vector2(window.innerWidth, window.innerHeight), b = new Vector2(this.desktop.actualResolution.x, this.desktop.actualResolution.y), this.scaleRatioMultiplier = new Vector2(this.desktop.actualSize.x / b.x, this.desktop.actualSize.y / b.y), c = Math.min(this.scaleRatioMultiplier.x, this.scaleRatioMultiplier.y), this.desktop.actualSize.x = b.x * c, this.desktop.actualSize.y = b.y * c;
            this.sizeRatio.x = window.innerWidth / this.mobile.actualResolution.x;
            this.sizeRatio.y = window.innerHeight / this.mobile.actualResolution.y
        },
        resizeLayers: function() {
            for (var b =
                0; b < this.coreDivsToResize.length; b++) {
                var c = ig.domHandler.getElementById(this.coreDivsToResize[b]);
                ig.ua.mobile ? ig.domHandler.resize(c, Math.floor(ig.sizeHandler.mobile.actualSize.x), Math.floor(ig.sizeHandler.mobile.actualSize.y)) : ig.domHandler.resizeOffsetLeft(c, Math.floor(ig.sizeHandler.desktop.actualSize.x), Math.floor(ig.sizeHandler.desktop.actualSize.y), Math.floor(ig.sizeHandler.windowSize.x / 2 - ig.sizeHandler.desktop.actualSize.x / 2))
            }
            for (var d in this.adsToResize) {
                var b = ig.domHandler.getElementById("#" +
                        d),
                    c = ig.domHandler.getElementById("#" + d + "-Box"),
                    e = (window.innerWidth - this.adsToResize[d]["box-width"]) / 2 + "px",
                    f = (window.innerHeight - this.adsToResize[d]["box-height"]) / 2 + "px";
                b && ig.domHandler.css(b, {
                    width: window.innerWidth,
                    height: window.innerHeight
                });
                c && ig.domHandler.css(c, {
                    left: e,
                    top: f
                })
            }
            for (d in this.dynamicClickableEntityDivs) {
                c = Math.min(ig.sizeHandler.scaleRatioMultiplier.x, ig.sizeHandler.scaleRatioMultiplier.y);
                b = ig.domHandler.getElementById("#" + d);
                if (ig.ua.mobile) var j = this.dynamicClickableEntityDivs[d].entity_pos_x,
                    t = this.dynamicClickableEntityDivs[d].entity_pos_y,
                    f = this.dynamicClickableEntityDivs[d].width,
                    e = this.dynamicClickableEntityDivs[d].height,
                    m = Math.floor(j * this.scaleRatioMultiplier.x) + "px",
                    t = Math.floor(t * this.scaleRatioMultiplier.y) + "px",
                    f = Math.floor(f * this.scaleRatioMultiplier.x) + "px",
                    c = Math.floor(e * this.scaleRatioMultiplier.y) + "px";
                else var e = ig.domHandler.getElementById("#canvas"),
                    e = ig.domHandler.getOffsets(e),
                    m = e.left,
                    r = e.top,
                    j = this.dynamicClickableEntityDivs[d].entity_pos_x,
                    t = this.dynamicClickableEntityDivs[d].entity_pos_y,
                    f = this.dynamicClickableEntityDivs[d].width,
                    e = this.dynamicClickableEntityDivs[d].height,
                    m = Math.floor(m + j * c) + "px",
                    t = Math.floor(r + t * c) + "px",
                    f = Math.floor(f * c) + "px",
                    c = Math.floor(e * c) + "px";
                ig.domHandler.css(b, {
                    "float": "left",
                    position: "absolute",
                    left: m,
                    top: t,
                    width: f,
                    height: c,
                    "z-index": 3
                })
            }
        },
        resize: function() {
            this.sizeCalcs();
            this.resizeLayers()
        },
        reorient: function() {
            if (ig.ua.mobile) {
                var b = this.portraitMode ? window.innerHeight < window.innerWidth : window.innerHeight > window.innerWidth,
                    c = this.domHandler.getElementById("#orientate"),
                    d = this.domHandler.getElementById("#game");
                b ? (this.domHandler.show(c), this.domHandler.hide(d)) : (this.domHandler.show(d), this.domHandler.hide(c))
            }
            ig.ua.mobile ? (this.resize(), this.resizeAds()) : this.resize()
        },
        resizeAds: function() {
            for (var b in this.adsToResize) {
                var c = ig.domHandler.getElementById("#" + b),
                    d = ig.domHandler.getElementById("#" + b + "-Box"),
                    e = (window.innerWidth - this.adsToResize[b]["box-width"]) / 2 + "px",
                    f = (window.innerHeight - this.adsToResize[b]["box-height"]) / 2 + "px";
                c && ig.domHandler.css(c, {
                    width: window.innerWidth,
                    height: window.innerHeight
                });
                d && ig.domHandler.css(d, {
                    left: e,
                    top: f
                })
            }
        },
        samsungFix: function() {
            ig.ua.android && !(4.2 > parseFloat(navigator.userAgent.slice(navigator.userAgent.indexOf("Android") + 8, navigator.userAgent.indexOf("Android") + 11))) && (!(0 > navigator.userAgent.indexOf("GT")) && !(0 < navigator.userAgent.indexOf("Chrome")) && !(0 < navigator.userAgent.indexOf("Firefox"))) && (document.addEventListener("touchstart", function(b) {
                b.preventDefault();
                return !1
            }, !1), document.addEventListener("touchmove", function(b) {
                b.preventDefault();
                return !1
            }, !1), document.addEventListener("touchend", function(b) {
                b.preventDefault();
                return !1
            }, !1))
        },
        eventListenerSetup: function() {
            window.addEventListener("resize", function() {
                this.reorient();
                window.scrollTo(0, 1)
            }.bind(this), !1);
            window.addEventListener("orientationchange", function() {
                this.reorient();
                window.scrollTo(0, 1)
            }.bind(this), !1);
            document.ontouchmove = function(b) {
                window.scrollTo(0, 1);
                b.preventDefault()
            }
        }
    })
});
ig.baked = !0;
ig.module("plugins.handlers.api-handler").defines(function() {
    ig.ApiHandler = ig.Class.extend({
        apiAvailable: {
            MJSPreroll: function() {
                ig.domHandler.JQUERYAVAILABLE && _SETTINGS && _SETTINGS.Ad.Mobile.Preroll.Enabled && MobileAdInGamePreroll.Initialize()
            },
            MJSHeader: function() {
                ig.ua.mobile && ig.domHandler.JQUERYAVAILABLE && _SETTINGS.Ad.Mobile.Header.Enabled && MobileAdInGameHeader.Initialize()
            },
            MJSFooter: function() {
                ig.ua.mobile && ig.domHandler.JQUERYAVAILABLE && _SETTINGS.Ad.Mobile.Footer.Enabled && MobileAdInGameFooter.Initialize()
            },
            MJSEnd: function() {
                ig.ua.mobile && ig.domHandler.JQUERYAVAILABLE && _SETTINGS.Ad.Mobile.End.Enabled && MobileAdInGameEnd.Initialize()
            }
        },
        run: function(b, c) {
            if (this.apiAvailable[b]) this.apiAvailable[b](c)
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.sound-player").defines(function() {
    SoundPlayer = ig.Class.extend({
        tagName: "SoundPlayer",
        stayMuteFlag: !1,
        debug: !1,
        init: function() {
            this.debug && console.log(this.tagName)
        },
        play: function(b) {
            this.debug && console.log("play sound ", b)
        },
        stop: function() {
            this.debug && console.log("stop sound ")
        },
        volume: function() {
            this.debug && console.log("set volume")
        },
        mute: function(b) {
            this.debug && console.log("mute");
            "undefined" === typeof b ? this.stayMuteFlag = !0 : b && (this.stayMuteFlag = !0)
        },
        unmute: function(b) {
            this.debug &&
                console.log("unmute");
            "undefined" === typeof b ? this.stayMuteFlag = !1 : b && (this.stayMuteFlag = !1)
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.impact-music-player").requires("plugins.audio.sound-player").defines(function() {
    ImpactMusicPlayer = SoundPlayer.extend({
        tagName: "ImpactMusicPlayer",
        bgmPlaying: !1,
        soundList: {},
        init: function(b, c) {
            this.parent(b, c);
            for (var d in b) this.soundList[d] = d, ig.music.add(b[d].path + ".*", d);
            c && c.loop && (ig.music.loop = c.loop)
        },
        play: function(b) {
            this.stayMuteFlag || (this.bgmPlaying = !0, "undefined" === typeof b ? ig.music.play(b) : ig.music.play())
        },
        stop: function() {
            this.bgmPlaying = !1;
            ig.music.pause()
        },
        volume: function(b) {
            console.log("impactmusic:", b);
            ig.music.volume = 0 > b ? 0 : isNaN(b) ? 1 : 1 < b ? 1 : b
        },
        getVolume: function() {
            return ig.music.volume
        },
        mute: function(b) {
            this.parent(b);
            this.bgmPlaying && this.stop()
        },
        unmute: function(b) {
            this.parent(b);
            this.play()
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.impact-sound-player").requires("plugins.audio.sound-player").defines(function() {
    ImpactSoundPlayer = SoundPlayer.extend({
        tagName: "ImpactSoundPlayer",
        soundList: {},
        init: function(b, c) {
            this.parent(b, c);
            for (var d in b) {
                var e = new ig.Sound(b[d].path + ".*");
                this.soundList[d] = e
            }
        },
        play: function(b) {
            this.stayMuteFlag || ("object" === typeof b ? (console.log(b + " exists"), b.play()) : "string" === typeof b && this.soundList[b].play())
        },
        stop: function(b) {
            this.parent(b);
            b.stop()
        },
        volume: function(b) {
            ig.soundManager.volume =
                0 > b ? 0 : isNaN(b) ? 1 : 1 < b ? 1 : b
        },
        getVolume: function() {
            return ig.soundManager.volume
        },
        mute: function(b) {
            this.parent(b);
            ig.Sound.enabled = !1
        },
        unmute: function(b) {
            this.parent(b);
            ig.Sound.enabled = !0
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.howler-player").requires("plugins.audio.sound-player").defines(function() {
    HowlerPlayer = SoundPlayer.extend({
        tagName: "HowlerPlayer",
        soundList: {},
        init: function(b, c) {
            this.parent(b, c);
            for (var d in b) {
                var e = b[d].path,
                    e = new Howl({
                        urls: [e + "." + ig.Sound.FORMAT.OGG.ext, e + "." + ig.Sound.FORMAT.MP3.ext]
                    });
                this.soundList[d] = e
            }
        },
        play: function(b) {
            this.stayMuteFlag || ("object" === typeof b ? b.play() : "string" === typeof b && this.soundList[b].play())
        },
        stop: function(b) {
            this.parent(b);
            b.stop()
        },
        volume: function(b) {
            for (var c in this.soundList) {
                if (0 >
                    b) {
                    this.soundList[c].volume(0);
                    break
                }
                isNaN(b) ? this.soundList[c].volume(1) : 1 < b ? this.soundList[c].volume(1) : this.soundList[c].volume(b)
            }
        },
        getVolume: function() {
            for (var b in this.soundList) return this.soundList[b].volume()
        },
        mute: function(b) {
            this.parent(b);
            Howler.mute()
        },
        unmute: function(b) {
            this.parent(b);
            Howler.unmute()
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.howler-music-player").requires("plugins.audio.sound-player").defines(function() {
    HowlerMusicPlayer = SoundPlayer.extend({
        tagName: "HowlerMusicPlayer",
        bgmPlaying: !1,
        soundList: {},
        init: function(b, c) {
            this.parent(b, c);
            for (var d in b) {
                var e = b[d].path,
                    e = new Howl({
                        urls: [e + "." + ig.Sound.FORMAT.OGG.ext, e + "." + ig.Sound.FORMAT.MP3.ext],
                        loop: !0,
                        autoplay: !1,
                        onend: function() {}.bind(this)
                    });
                this.soundList[d] = e
            }
        },
        play: function(b) {
            if (!this.stayMuteFlag && !this.bgmPlaying)
                if ("object" === typeof b) this.bgmPlaying = !0, b.play();
                else if ("string" === typeof b) this.bgmPlaying = !0, this.soundList[b].play();
            else
                for (var c in this.soundList) {
                    this.soundList[c].play();
                    this.bgmPlaying = !0;
                    break
                }
        },
        stop: function(b) {
            this.parent(b);
            if (this.bgmPlaying) {
                for (var c in this.soundList) this.soundList[c].stop();
                this.bgmPlaying = !1
            }
        },
        volume: function(b) {
            for (var c in this.soundList) {
                if (0 > b) {
                    this.soundList[c].volume(0);
                    break
                }
                isNaN(b) ? this.soundList[c].volume(1) : 1 < b ? this.soundList[c].volume(1) : this.soundList[c].volume(b)
            }
        },
        getVolume: function() {
            for (var b in this.soundList) return this.soundList[b].volume()
        },
        mute: function(b) {
            this.parent(b);
            Howler.mute()
        },
        unmute: function(b) {
            this.parent(b);
            Howler.unmute()
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.jukebox-player").requires("plugins.audio.sound-player").defines(function() {
    JukeboxPlayer = SoundPlayer.extend({
        tagName: "JukeboxPlayer",
        bgmPlaying: !1,
        soundList: {},
        jukeboxPlayer: null,
        pausePosition: 0,
        premuteVolume: 0,
        minVolume: 0.0010,
        init: function(b, c) {
            this.parent(b, c);
            for (var d in b) {
                this.soundList[d] = d;
                var e = b[d].path;
                this.jukeboxPlayer = new jukebox.Player({
                    resources: [e + "." + ig.Sound.FORMAT.OGG.ext, e + "." + ig.Sound.FORMAT.MP3.ext],
                    autoplay: !1,
                    spritemap: {
                        music: {
                            start: b[d].startMp3,
                            end: b[d].endMp3,
                            loop: !0
                        }
                    }
                })
            }
        },
        play: function() {
            this.stayMuteFlag || (this.bgmPlaying = !0, this.pausePosition ? (console.log("resume"), this.jukeboxPlayer.resume(this.pausePosition)) : (console.log("play"), this.jukeboxPlayer.play(this.jukeboxPlayer.settings.spritemap.music.start, !0)), this.premuteVolume = this.getVolume())
        },
        stop: function() {
            this.bgmPlaying = !1;
            this.pausePosition = this.jukeboxPlayer.pause()
        },
        volume: function(b) {
            console.log("jukebox:", b);
            0 >= b ? this.jukeboxPlayer.setVolume(this.minVolume) : isNaN(b) ? this.jukeboxPlayer.setVolume(1) :
                1 < b ? this.jukeboxPlayer.setVolume(1) : this.jukeboxPlayer.setVolume(b)
        },
        getVolume: function() {
            return this.jukeboxPlayer.getVolume()
        },
        mute: function(b) {
            this.parent(b);
            this.bgmPlaying && (console.log("jukebox", this.premuteVolume), this.stayMuteFlag || (this.premuteVolume = this.getVolume()), this.jukeboxPlayer.pause(), this.jukeboxPlayer.setVolume(this.minVolume))
        },
        unmute: function(b) {
            this.parent(b);
            this.stayMuteFlag || (console.log("jukebox", this.premuteVolume), this.jukeboxPlayer.setVolume(this.premuteVolume), this.jukeboxPlayer.resume())
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.webaudio-music-player").requires("plugins.audio.sound-player").defines(function() {
    WebaudioMusicPlayer = SoundPlayer.extend({
        bgmPlaying: !1,
        isSupported: !1,
        muteFlag: !1,
        pausedTime: 0,
        webaudio: null,
        useHTML5Audio: !1,
        audio: null,
        inactiveAudio: null,
        codecs: null,
        _volume: 1,
        soundList: {},
        init: function(b) {
            this.webaudio = {
                compatibility: {},
                gainNode: null,
                buffer: null,
                source_loop: {},
                source_once: {}
            };
            try {
                this.AudioContext = window.AudioContext || window.webkitAudioContext, this.webaudio.context = new this.AudioContext,
                    this.isSupported = !0
            } catch (c) {
                console.log("Web Audio API not supported in this browser."), this.webaudio = null, this.useHTML5Audio = !0
            }
            if (this.useHTML5Audio)
                if ("undefined" !== typeof Audio) try {
                    new Audio
                } catch (d) {
                    this.useHTML5Audio = !1
                } else this.useHTML5Audio = !1;
            this.useHTML5Audio && (this.audio = new Audio, this.isSupported = !0, this.initHTML5Audio(b));
            if (!this.isSupported) return null;
            this.webaudio && this.initWebAudio(b)
        },
        initWebAudio: function(b) {
            ig.ua.iOS && this.initIOSWebAudioUnlock();
            this.webaudio.gainNode = this.webaudio.context.createGain();
            this.webaudio.gainNode.connect(this.webaudio.context.destination);
            this.webaudio.gainNode.gain.value = this._volume;
            var c = "start",
                d = "stop",
                e = this.webaudio.context.createBufferSource();
            "function" !== typeof e.start && (c = "noteOn");
            this.webaudio.compatibility.start = c;
            "function" !== typeof e.stop && (d = "noteOff");
            this.webaudio.compatibility.stop = d;
            for (var f in b) {
                this.soundList[f] = f;
                c = b[f].path;
                b = c + "." + ig.Sound.FORMAT.MP3.ext;
                var j = c + "." + ig.Sound.FORMAT.OGG.ext;
                ig.ua.mobile ? ig.ua.iOS && (j = b) : (c = navigator.userAgent.toLowerCase(), -1 != c.indexOf("safari") && -1 >= c.indexOf("chrome") && (j = b));
                var t = new XMLHttpRequest;
                t.open("GET", j, !0);
                t.responseType = "arraybuffer";
                t.onload = function() {
                    this.webaudio.context.decodeAudioData(t.response, function(b) {
                        this.webaudio.buffer = b;
                        this.webaudio.source_loop = {};
                        this.bgmPlaying ? this.play() : this.stop()
                    }.bind(this), function() {
                        console.log('Error decoding audio "' + j + '".')
                    })
                }.bind(this);
                t.send();
                break
            }
        },
        initIOSWebAudioUnlock: function() {
            if (this.webaudio) {
                webaudio = this.webaudio;
                var b = function() {
                    var c = webaudio.context,
                        d = c.createBuffer(1, 1, 22050),
                        e = c.createBufferSource();
                    e.buffer = d;
                    e.connect(c.destination);
                    "undefined" === typeof e.start ? e.noteOn(0) : e.start(0);
                    setTimeout(function() {
                        (e.playbackState === e.PLAYING_STATE || e.playbackState === e.FINISHED_STATE) && window.removeEventListener("touchend", b, !1)
                    }, 0)
                };
                window.addEventListener("touchend", b, !1)
            }
        },
        initHTML5Audio: function(b) {
            if (this.useHTML5Audio && this.audio) {
                var c = this.audio;
                this.codecs = {};
                this.codecs = {
                    mp3: !!c.canPlayType("audio/mpeg;").replace(/^no$/, ""),
                    opus: !!c.canPlayType('audio/ogg; codecs="opus"').replace(/^no$/,
                        ""),
                    ogg: !!c.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/, ""),
                    wav: !!c.canPlayType('audio/wav; codecs="1"').replace(/^no$/, ""),
                    aac: !!c.canPlayType("audio/aac;").replace(/^no$/, ""),
                    m4a: !!(c.canPlayType("audio/x-m4a;") || c.canPlayType("audio/m4a;") || c.canPlayType("audio/aac;")).replace(/^no$/, ""),
                    mp4: !!(c.canPlayType("audio/x-mp4;") || c.canPlayType("audio/mp4;") || c.canPlayType("audio/aac;")).replace(/^no$/, ""),
                    weba: !!c.canPlayType('audio/webm; codecs="vorbis"').replace(/^no$/, "")
                };
                this.is = {
                    ff: Boolean(null !=
                        window.mozInnerScreenX && /firefox/.test(navigator.userAgent.toLowerCase())),
                    ie: Boolean(document.all && !window.opera),
                    opera: Boolean(window.opera),
                    chrome: Boolean(window.chrome),
                    safari: Boolean(!window.chrome && /safari/.test(navigator.userAgent.toLowerCase()) && window.getComputedStyle && !window.globalStorage && !window.opera)
                };
                this.playDelay = -60;
                this.stopDelay = 30;
                this.is.chrome && (this.playDelay = -25);
                this.is.chrome && (this.stopDelay = 25);
                this.is.ff && (this.playDelay = -25);
                this.is.ff && (this.stopDelay = 85);
                this.is.opera &&
                    (this.playDelay = 5);
                this.is.opera && (this.stopDelay = 0);
                for (var d in b) {
                    this.soundList[d] = d;
                    var e = b[d].path,
                        c = e + "." + ig.Sound.FORMAT.OGG.ext,
                        e = e + "." + ig.Sound.FORMAT.MP3.ext,
                        f = null;
                    this.codecs[ig.Sound.FORMAT.OGG.ext.toLowerCase()] ? f = c : this.codecs[ig.Sound.FORMAT.MP3.ext.toLowerCase()] && (f = e);
                    if (f) {
                        ig.ua.mobile ? ig.ua.iOS && (f = e) : (b = navigator.userAgent.toLowerCase(), -1 != b.indexOf("safari") && -1 >= b.indexOf("chrome") && (f = e));
                        this.audio.addEventListener("error", function() {
                            this.audio.error && 4 === this.audio.error.code &&
                                (this.isSupported = !1)
                        }, !1);
                        this.audio.src = f;
                        this.audio._pos = 0;
                        this.audio.preload = "auto";
                        this.audio.volume = this._volume;
                        this.inactiveAudio = new Audio;
                        this.inactiveAudio.src = f;
                        this.inactiveAudio._pos = 0;
                        this.inactiveAudio.preload = "auto";
                        this.inactiveAudio.volume = this._volume;
                        this.inactiveAudio.load();
                        var j = function() {
                            this._duration = this.audio.duration;
                            this._loaded || (this._loaded = !0);
                            this.bgmPlaying ? this.play() : this.stop();
                            this.audio.removeEventListener("canplaythrough", j, !1)
                        }.bind(this);
                        this.audio.addEventListener("canplaythrough",
                            j, !1);
                        this.audio.load();
                        break
                    }
                }
            }
        },
        play: function(b) {
            if (this.isSupported)
                if (this.bgmPlaying = !0, this.webaudio)
                    if (this.webaudio.buffer) {
                        if (!this.muteFlag && (this.bgmPlaying = !0, !this.webaudio.source_loop._playing)) {
                            this.webaudio.source_loop = this.webaudio.context.createBufferSource();
                            this.webaudio.source_loop.buffer = this.webaudio.buffer;
                            this.webaudio.source_loop.loop = !0;
                            this.webaudio.source_loop.connect(this.webaudio.gainNode);
                            isNaN(b) && (b = 0, this.pausedTime && (b = this.pausedTime));
                            this.webaudio.source_loop._startTime =
                                this.webaudio.context.currentTime;
                            if ("noteOn" === this.webaudio.compatibility.start) this.webaudio.source_once = this.webaudio.context.createBufferSource(), this.webaudio.source_once.buffer = this.webaudio.buffer, this.webaudio.source_once.connect(this.webaudio.gainNode), this.webaudio.source_once.noteGrainOn(0, b, this.webaudio.buffer.duration - b), this.webaudio.source_loop[this.webaudio.compatibility.start](this.webaudio.context.currentTime + (this.webaudio.buffer.duration - b));
                            else this.webaudio.source_loop[this.webaudio.compatibility.start](0,
                                b);
                            this.webaudio.source_loop._playing = !0
                        }
                    } else this.bgmPlaying = !0;
            else if (this.audio) {
                var c = this.audio;
                if (!this.muteFlag) {
                    this.bgmPlaying = !0;
                    isNaN(b) && (b = 0, this.pausedTime && (b = this.pausedTime));
                    var d = this._duration - b;
                    this._onEndTimer && (clearTimeout(this._onEndTimer), this._onEndTimer = null);
                    this._onEndTimer = setTimeout(function() {
                            this.audio.currentTime = 0;
                            this.audio.pause();
                            this.pausedTime = 0;
                            if (this.inactiveAudio) {
                                var b = this.audio;
                                this.audio = this.inactiveAudio;
                                this.inactiveAudio = b
                            }
                            this.play()
                        }.bind(this),
                        1E3 * d + this.playDelay);
                    4 === c.readyState || !c.readyState && navigator.isCocoonJS ? (c.readyState = 4, c.currentTime = b, c.muted = this.muteFlag || c.muted, c.volume = this._volume, setTimeout(function() {
                        c.play()
                    }, 0)) : (clearTimeout(this._onEndTimer), this._onEndTimer = null, function() {
                        var b = function() {
                            this.play();
                            c.removeEventListener("canplaythrough", b, !1)
                        }.bind(this);
                        c.addEventListener("canplaythrough", b, !1)
                    }())
                }
            }
        },
        stop: function() {
            this.bgmPlaying = !1;
            if (this.isSupported)
                if (this.webaudio) {
                    if (this.webaudio.source_loop._playing &&
                        (this.webaudio.source_loop[this.webaudio.compatibility.stop](0), this.webaudio.source_loop._playing = !1, this.pausedTime += this.webaudio.context.currentTime - this.webaudio.source_loop._startTime, this.pausedTime %= this.webaudio.source_loop.buffer.duration, this.webaudio.source_loop._startTime = 0, "noteOn" === this.webaudio.compatibility.start)) this.webaudio.source_once[this.webaudio.compatibility.stop](0)
                } else if (this.audio) {
                var b = this.audio;
                this.pausedTime = b.currentTime;
                b.currentTime = 0;
                b.pause();
                clearTimeout(this._onEndTimer);
                this._onEndTimer = null
            }
        },
        volume: function(b) {
            this.isSupported && (this._volume = b, 0 > this._volume ? this._volume = 0 : 1 < this._volume && (this._volume = 1), this.webaudio ? this.webaudio.gainNode && (this.webaudio.gainNode.gain.value = this._volume) : this.audio && (this.audio.volume = this._volume, this.inactiveAudio && (this.inactiveAudio.volume = this._volume)))
        },
        getVolume: function() {
            return !this.isSupported ? 0 : this._volume
        },
        mute: function(b) {
            this.parent(b);
            !1 == this.muteFlag && (this.muteFlag = !0, this.bgmPlaying && (this.stop(), this.bgmPlaying = !0))
        },
        unmute: function(b) {
            this.parent(b);
            !this.stayMuteFlag && !0 == this.muteFlag && (this.muteFlag = !1, this.bgmPlaying && this.play())
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.sound-info").defines(function() {
    SoundInfo = ig.Class.extend({
        FORMATS: {
            OGG: ".ogg",
            MP3: ".mp3"
        },
        sfx: {
            kittyopeningSound: {
                path: "media/audio/opening/kittyopening"
            },
            staticSound: {
                path: "media/audio/play/static"
            },
            openingSound: {
                path: "media/audio/opening/opening"
            },
            pieceMove: {
                path: "media/audio/game/piece_move"
            },
            kingFanfare: {
                path: "media/audio/game/king_fanfare"
            },
            click: {
                path: "media/audio/game/click"
            },
            history: {
                path: "media/audio/game/history"
            },
            invalid: {
                path: "media/audio/game/invalid"
            },
            hint: {
                path: "media/audio/game/hint"
            },
            win: {
                path: "media/audio/game/win"
            },
            lose: {
                path: "media/audio/game/lose"
            }
        },
        bgm: {
            background: {
                path: "media/audio/game/bgm",
                startOgg: 0,
                endOgg: 14.741,
                startMp3: 0,
                endMp3: 14.741
            }
        }
    })
});
ig.baked = !0;
ig.module("plugins.audio.sound-handler").requires("plugins.audio.impact-music-player", "plugins.audio.impact-sound-player", "plugins.audio.howler-player", "plugins.audio.howler-music-player", "plugins.audio.jukebox-player", "plugins.audio.webaudio-music-player", "plugins.audio.sound-info").defines(function() {
    ig.SoundHandler = ig.Class.extend({
        bgmPlayer: null,
        sfxPlayer: null,
        focusBlurMute: !1,
        soundInfo: new SoundInfo,
        init: function() {
            console.log("Initiating sound handler");
            this.initWindowHandler();
            ig.ua.mobile ?
                (this.initPowerButtonFix(), this.bgmPlayer = new WebaudioMusicPlayer(this.soundInfo.bgm, {
                    loop: !0
                }), this.bgmPlayer.isSupported || (this.bgmPlayer = new JukeboxPlayer(this.soundInfo.bgm, {
                    loop: !0
                }))) : (this.bgmPlayer = new WebaudioMusicPlayer(this.soundInfo.bgm, {
                    loop: !0
                }), this.bgmPlayer.isSupported || (this.bgmPlayer = new ImpactMusicPlayer(this.soundInfo.bgm, {
                    loop: !0
                })));
            this.sfxPlayer = new HowlerPlayer(this.soundInfo.sfx)
        },
        checkBGM: function() {
            return this.bgmPlayer.stayMuteFlag
        },
        checkSFX: function() {
            return this.sfxPlayer.stayMuteFlag
        },
        muteSFX: function(b) {
            this.sfxPlayer && this.sfxPlayer.mute(b)
        },
        muteBGM: function(b) {
            this.bgmPlayer && this.bgmPlayer.mute(b)
        },
        unmuteSFX: function(b) {
            this.sfxPlayer && this.sfxPlayer.unmute(b)
        },
        unmuteBGM: function(b) {
            this.bgmPlayer && this.bgmPlayer.unmute(b)
        },
        muteAll: function(b) {
            this.muteSFX(b);
            this.muteBGM(b)
        },
        unmuteAll: function(b) {
            this.unmuteSFX(b);
            this.unmuteBGM(b)
        },
        forceMuteAll: function() {
            this.focusBlurMute || this.muteAll(!1);
            this.focusBlurMute = !0
        },
        forceUnMuteAll: function() {
            this.focusBlurMute && (this.unmuteAll(!1),
                this.focusBlurMute = !1)
        },
        initWindowHandler: function() {
            "true" === ig.domHandler.getQueryVariable("webview") ? ($(window).focus(function() {
                ig.soundHandler && ig.soundHandler.forceUnMuteAll()
            }), $(window).blur(function() {
                ig.soundHandler && ig.soundHandler.forceMuteAll()
            })) : (window.onfocus = function() {
                ig.soundHandler && ig.soundHandler.forceUnMuteAll()
            }, window.onblur = function() {
                ig.soundHandler && ig.soundHandler.forceMuteAll()
            })
        },
        initPowerButtonFix: function() {
            var b = this.getHiddenProp();
            b && (b = b.replace(/[H|h]idden/,
                "") + "visibilitychange", document.addEventListener(b, this.visChange));
            window.addEventListener("pagehide", function() {
                ig.soundHandler && ig.soundHandler.forceMuteAll()
            }, !1);
            window.addEventListener("pageshow", function() {
                ig.soundHandler && ig.soundHandler.forceUnMuteAll()
            }, !1)
        },
        getHiddenProp: function() {
            var b = ["webkit", "moz", "ms", "o"];
            if ("hidden" in document) return "hidden";
            for (var c = 0; c < b.length; c++)
                if (b[c] + "Hidden" in document) return b[c] + "Hidden";
            return null
        },
        isHidden: function() {
            var b = this.getHiddenProp();
            return !b ?
                !1 : document[b]
        },
        visChange: function() {
            ig.soundHandler.isHidden() ? ig.soundHandler && ig.soundHandler.forceMuteAll() : ig.soundHandler && ig.soundHandler.forceUnMuteAll()
        },
        saveVolume: function() {
            this.sfxPlayer && ig.game.io.storageSet("soundVolume", this.sfxPlayer.getVolume());
            this.bgmPlayer && ig.game.io.storageSet("musicVolume", this.bgmPlayer.getVolume())
        },
        forceLoopBGM: function() {
            var b;
            if (!this.focusBlurMute && this.bgmPlayer.bgmPlaying && this.bgmPlayer) {
                var c = this.bgmPlayer.jukeboxPlayer;
                if (c) {
                    null != window.mozInnerScreenX &&
                        /firefox/.test(navigator.userAgent.toLowerCase());
                    b = Boolean(window.chrome);
                    !window.chrome && /safari/.test(navigator.userAgent.toLowerCase());
                    var d = 0.1;
                    ig.ua.mobile && (d = 0.115, ig.ua.android && (d = 0.45, b && (d = 0.3)));
                    c.settings.spritemap.music && (b = c.settings.spritemap.music.end - d, c.getCurrentTime() >= b && (b = c.settings.spritemap.music.start, ig.ua.android ? this.forcelooped || (c.play(b, !0), this.forcelooped = !0, setTimeout(function() {
                        ig.soundHandler.forcelooped = !1
                    }, d)) : c.setCurrentTime(b)))
                } else "ImpactMusicPlayer" ==
                    this.bgmPlayer.tagName && (null != window.mozInnerScreenX && /firefox/.test(navigator.userAgent.toLowerCase()), b = Boolean(window.chrome), !window.chrome && /safari/.test(navigator.userAgent.toLowerCase()), d = 0.1, ig.ua.mobile && (d = 0.115, ig.ua.android && (d = 0.45, b && (d = 0.3))), c = 0, "mp3" == ig.soundManager.format.ext && (c = 0.05), ig.music.currentTrack && (b = ig.music.currentTrack.duration - d, ig.music.currentTrack.currentTime >= b && (ig.ua.android ? this.forcelooped || (ig.music.currentTrack.pause(), ig.music.currentTrack.currentTime =
                        c, ig.music.currentTrack.play(), this.forcelooped = !0, setTimeout(function() {
                            ig.soundHandler.forcelooped = !1
                        }, d)) : ig.music.currentTrack.currentTime = c)))
            }
        }
    })
});
ig.baked = !0;
ig.module("plugins.io.storage").defines(function() {
    ig.Storage = ig.Class.extend({
        staticInstantiate: function() {
            return !ig.Storage.instance ? null : ig.Storage.instance
        },
        init: function() {
            ig.Storage.instance = this
        },
        isCapable: function() {
            return "undefined" !== typeof window.localStorage
        },
        isSet: function(b) {
            return null !== this.get(b)
        },
        initUnset: function(b, c) {
            null === this.get(b) && this.set(b, c)
        },
        get: function(b) {
            if (!this.isCapable()) return null;
            try {
                return JSON.parse(localStorage.getItem(b))
            } catch (c) {
                return window.localStorage.getItem(b)
            }
        },
        getInt: function(b) {
            return ~~this.get(b)
        },
        getFloat: function(b) {
            return parseFloat(this.get(b))
        },
        getBool: function(b) {
            return !!this.get(b)
        },
        key: function(b) {
            return this.isCapable() ? window.localStorage.key(b) : null
        },
        set: function(b, c) {
            if (!this.isCapable()) return null;
            try {
                window.localStorage.setItem(b, JSON.stringify(c))
            } catch (d) {
                console.log(d)
            }
        },
        setHighest: function(b, c) {
            c > this.getFloat(b) && this.set(b, c)
        },
        remove: function(b) {
            if (!this.isCapable()) return null;
            window.localStorage.removeItem(b)
        },
        clear: function() {
            if (!this.isCapable()) return null;
            window.localStorage.clear()
        }
    })
});
ig.baked = !0;
ig.module("plugins.io.mouse").defines(function() {
    Mouse = ig.Class.extend({
        bindings: {
            click: [ig.KEY.MOUSE1]
        },
        init: function() {
            ig.input.initMouse();
            for (var b in this.bindings) {
                this[b] = b;
                for (var c = 0; c < this.bindings[b].length; c++) ig.input.bind(this.bindings[b][c], b)
            }
        },
        getPos: function() {
            if (ig.ua.mobile) var b = ig.input.mouse.x / ig.sizeHandler.sizeRatio.x,
                c = ig.input.mouse.y / ig.sizeHandler.sizeRatio.y;
            else b = ig.input.mouse.x, c = ig.input.mouse.y;
            return new Vector2(b, c)
        }
    })
});
ig.baked = !0;
ig.module("plugins.io.keyboard").defines(function() {
    Keyboard = ig.Class.extend({
        bindings: {
            jump: [ig.KEY.W, ig.KEY.UP_ARROW],
            moveright: [ig.KEY.D, ig.KEY.RIGHT_ARROW],
            moveleft: [ig.KEY.A, ig.KEY.LEFT_ARROW],
            shoot: [ig.KEY.S, ig.KEY.DOWN_ARROW, ig.KEY.SPACE]
        },
        init: function() {
            for (var b in this.bindings) {
                this[b] = b;
                for (var c = 0; c < this.bindings[b].length; c++) ig.input.bind(this.bindings[b][c], b)
            }
        }
    })
});
ig.baked = !0;
ig.module("plugins.io.gamepad-input").defines(function() {
    ig.PADKEY = {
        BUTTON_0: 0,
        PADBUTTON_1: 1,
        BUTTON_2: 2,
        BUTTON_3: 3,
        BUTTON_LEFT_BUMPER: 4,
        BUTTON_RIGHT_BUMPER: 5,
        BUTTON_LEFT_TRIGGER: 6,
        BUTTON_RIGHT_TRIGGER: 7,
        BUTTON_LEFT_JOYSTICK: 10,
        BUTTON_RIGHT_JOYSTICK: 11,
        BUTTON_DPAD_UP: 12,
        BUTTON_DPAD_DOWN: 13,
        BUTTON_DPAD_LEFT: 14,
        BUTTON_DPAD_RIGHT: 15,
        BUTTON_MENU: 16,
        AXIS_LEFT_JOYSTICK_X: 0,
        AXIS_LEFT_JOYSTICK_Y: 1,
        AXIS_RIGHT_JOYSTICK_X: 2,
        AXIS_RIGHT_JOYSTICK_Y: 3
    };
    ig.GamepadInput = ig.Class.extend({
        isInit: !1,
        isSupported: !1,
        list: [],
        bindings: {},
        states: {},
        presses: {},
        releases: {},
        downLocks: {},
        upLocks: {},
        leftStick: {
            x: 0,
            y: 0
        },
        rightStick: {
            x: 0,
            y: 0
        },
        start: function() {
            if (!this.isInit) {
                this.isInit = !0;
                var b = navigator.getGamepads || navigator.webkitGetGamepads;
                b && (!navigator.getGamepads && navigator.webkitGetGamepads && (navigator.getGamepads = navigator.webkitGetGamepads), this.list = navigator.getGamepads());
                this.isSupported = b
            }
        },
        isAvailable: function() {
            return this.isInit && this.isSupported
        },
        buttonPressed: function(b) {
            return "object" == typeof b ? b.pressed :
                1 == b
        },
        buttonDown: function(b) {
            if (b = this.bindings[b]) this.states[b] = !0, this.downLocks[b] || (this.presses[b] = !0, this.downLocks[b] = !0)
        },
        buttonUp: function(b) {
            if ((b = this.bindings[b]) && this.downLocks[b] && !this.upLocks[b]) this.states[b] = !1, this.releases[b] = !0, this.upLocks[b] = !0
        },
        clearPressed: function() {
            for (var b in this.releases) this.states[b] = !1, this.downLocks[b] = !1;
            this.releases = {};
            this.presses = {};
            this.upLocks = {}
        },
        bind: function(b, c) {
            this.bindings[b] = c
        },
        unbind: function(b) {
            this.releases[this.bindings[b]] = !0;
            this.bindings[b] = null
        },
        unbindAll: function() {
            this.bindings = {};
            this.states = {};
            this.presses = {};
            this.releases = {};
            this.downLocks = {};
            this.upLocks = {}
        },
        state: function(b) {
            return this.states[b]
        },
        pressed: function(b) {
            return this.presses[b]
        },
        released: function(b) {
            return this.releases[b]
        },
        clamp: function(b, c, d) {
            return b < c ? c : b > d ? d : b
        },
        pollGamepads: function() {
            if (this.isSupported) {
                this.leftStick.x = 0;
                this.leftStick.y = 0;
                this.rightStick.x = 0;
                this.rightStick.y = 0;
                this.list = navigator.getGamepads();
                for (var b in this.bindings) {
                    for (var c = !1, d = 0; d < this.list.length; d++) {
                        var e = this.list[d];
                        if (e && e.buttons && this.buttonPressed(e.buttons[b])) {
                            c = !0;
                            break
                        }
                    }
                    c ? this.buttonDown(b) : this.buttonUp(b)
                }
                for (d = 0; d < this.list.length; d++)
                    if ((e = this.list[d]) && e.axes) {
                        b = e.axes[ig.GAMEPADINPUT.AXIS_LEFT_JOYSTICK_X];
                        var c = e.axes[ig.GAMEPADINPUT.AXIS_LEFT_JOYSTICK_Y],
                            f = e.axes[ig.GAMEPADINPUT.AXIS_RIGHT_JOYSTICK_X],
                            e = e.axes[ig.GAMEPADINPUT.AXIS_RIGHT_JOYSTICK_Y];
                        this.leftStick.x += isNaN(b) ? 0 : b;
                        this.leftStick.y += isNaN(c) ? 0 : c;
                        this.rightStick.x += isNaN(f) ? 0 : f;
                        this.rightStick.y +=
                            isNaN(e) ? 0 : e
                    }
                0 < this.list.length && (this.leftStick.x = this.clamp(this.leftStick.x, -1, 1), this.leftStick.y = this.clamp(this.leftStick.y, -1, 1), this.rightStick.x = this.clamp(this.rightStick.x, -1, 1), this.rightStick.y = this.clamp(this.rightStick.y, -1, 1))
            }
        }
    })
});
ig.baked = !0;
ig.module("plugins.io.gamepad").requires("plugins.io.gamepad-input").defines(function() {
    Gamepad = ig.Class.extend({
        bindings: {
            padJump: [ig.PADKEY.BUTTON_0]
        },
        init: function() {
            ig.gamepadInput.start();
            for (var b in this.bindings)
                for (var c = 0; c < this.bindings[b].length; c++) ig.gamepadInput.bind(this.bindings[b][c], b)
        },
        press: function() {},
        held: function() {},
        release: function() {}
    })
});
ig.baked = !0;
ig.module("plugins.io.multitouch").defines(function() {
    Multitouch = ig.Class.extend({
        init: function() {
            ig.multitouchInput.start()
        },
        getTouchesPos: function() {
            if (ig.ua.mobile) {
                if (0 < ig.multitouchInput.touches.length) {
                    for (var b = [], c = 0; c < ig.multitouchInput.touches.length; c++) {
                        var d = ig.multitouchInput.touches[c];
                        b.push({
                            x: d.x,
                            y: d.y
                        })
                    }
                    return b
                }
                return null
            }
        }
    })
});
ig.baked = !0;
ig.module("plugins.io.multitouch-input").defines(function() {
    ig.MultitouchInput = ig.Class.extend({
        isStart: !1,
        touches: [],
        multitouchCapable: !1,
        lastEventUp: null,
        start: function() {
            this.isStart || (this.isStart = !0, navigator.maxTouchPoints && 1 < navigator.maxTouchPoints && (this.multitouchCapable = !0), ig.ua.touchDevice && (window.navigator.msPointerEnabled && (ig.system.canvas.addEventListener("MSPointerDown", this.touchdown.bind(this), !1), ig.system.canvas.addEventListener("MSPointerUp", this.touchup.bind(this), !1), ig.system.canvas.addEventListener("MSPointerMove",
                this.touchmove.bind(this), !1), ig.system.canvas.style.msContentZooming = "none", ig.system.canvas.style.msTouchAction = "none"), ig.system.canvas.addEventListener("touchstart", this.touchdown.bind(this), !1), ig.system.canvas.addEventListener("touchend", this.touchup.bind(this), !1), ig.system.canvas.addEventListener("touchmove", this.touchmove.bind(this), !1)))
        },
        touchmove: function(b) {
            if (ig.ua.touchDevice) {
                var c = parseInt(ig.system.canvas.offsetWidth) || ig.system.realWidth,
                    d = parseInt(ig.system.canvas.offsetHeight) ||
                    ig.system.realHeight,
                    c = ig.system.scale * (c / ig.system.realWidth),
                    d = ig.system.scale * (d / ig.system.realHeight);
                if (b.touches) {
                    for (; 0 < this.touches.length;) this.touches.pop();
                    !this.multitouchCapable && 1 < b.touches.length && (this.multitouchCapable = !0);
                    var e = {
                        left: 0,
                        top: 0
                    };
                    ig.system.canvas.getBoundingClientRect && (e = ig.system.canvas.getBoundingClientRect());
                    for (var f = 0; f < b.touches.length; f++) {
                        var j = b.touches[f];
                        j && this.touches.push({
                            x: (j.clientX - e.left) / c,
                            y: (j.clientY - e.top) / d
                        })
                    }
                } else this.windowMove(b)
            }
        },
        touchdown: function(b) {
            var c =
                parseInt(ig.system.canvas.offsetWidth) || ig.system.realWidth,
                d = parseInt(ig.system.canvas.offsetHeight) || ig.system.realHeight,
                c = ig.system.scale * (c / ig.system.realWidth),
                d = ig.system.scale * (d / ig.system.realHeight);
            if (window.navigator.msPointerEnabled) this.windowKeyDown(b);
            else if (ig.ua.touchDevice && b.touches) {
                for (; 0 < this.touches.length;) this.touches.pop();
                !this.multitouchCapable && 1 < b.touches.length && (this.multitouchCapable = !0);
                var e = {
                    left: 0,
                    top: 0
                };
                ig.system.canvas.getBoundingClientRect && (e = ig.system.canvas.getBoundingClientRect());
                for (var f = 0; f < b.touches.length; f++) {
                    var j = b.touches[f];
                    j && this.touches.push({
                        x: (j.clientX - e.left) / c,
                        y: (j.clientY - e.top) / d
                    })
                }
            }
        },
        touchup: function(b) {
            var c = parseInt(ig.system.canvas.offsetWidth) || ig.system.realWidth;
            parseInt(ig.system.canvas.offsetHeight);
            c = ig.system.scale * (c / ig.system.realWidth);
            if (window.navigator.msPointerEnabled) this.windowKeyUp(b);
            else {
                this.lastEventUp = b;
                var d = {
                    left: 0,
                    top: 0
                };
                ig.system.canvas.getBoundingClientRect && (d = ig.system.canvas.getBoundingClientRect());
                if (ig.ua.touchDevice) {
                    b =
                        (b.changedTouches[0].clientX - d.left) / c;
                    for (c = 0; c < this.touches.length; c++) this.touches[c].x >= b - 40 && this.touches[c].x <= b + 40 && this.touches.splice(c, 1)
                }
            }
        },
        windowKeyDown: function(b) {
            var c = parseInt(ig.system.canvas.offsetWidth) || ig.system.realWidth,
                d = parseInt(ig.system.canvas.offsetHeight) || ig.system.realHeight,
                c = ig.system.scale * (c / ig.system.realWidth),
                d = ig.system.scale * (d / ig.system.realHeight);
            if (window.navigator.msPointerEnabled) {
                var e = {
                    left: 0,
                    top: 0
                };
                ig.system.canvas.getBoundingClientRect && (e = ig.system.canvas.getBoundingClientRect());
                b = b.changedTouches ? b.changedTouches : [b];
                for (var f = 0; f < b.length; ++f) {
                    for (var j = b[f], t = "undefined" != typeof j.identifier ? j.identifier : "undefined" != typeof j.pointerId ? j.pointerId : 1, m = (j.clientX - e.left) / c, j = (j.clientY - e.top) / d, r = 0; r < this.touches.length; ++r) this.touches[r].identifier == t && this.touches.splice(r, 1);
                    this.touches.push({
                        x: m,
                        y: j,
                        identifier: t
                    })
                }
                for (c = 0; c < this.touches.length; c++);
            }
        },
        windowKeyUp: function(b) {
            b = "undefined" != typeof b.identifier ? b.identifier : "undefined" != typeof b.pointerId ? b.pointerId :
                1;
            for (var c = 0; c < this.touches.length; ++c) this.touches[c].identifier == b && this.touches.splice(c, 1);
            for (; 0 < this.touches.length;) this.touches.pop()
        },
        windowMove: function(b) {
            var c = parseInt(ig.system.canvas.offsetWidth) || ig.system.realWidth,
                d = parseInt(ig.system.canvas.offsetHeight) || ig.system.realHeight,
                c = ig.system.scale * (c / ig.system.realWidth),
                d = ig.system.scale * (d / ig.system.realHeight),
                e = {
                    left: 0,
                    top: 0
                };
            ig.system.canvas.getBoundingClientRect && (e = ig.system.canvas.getBoundingClientRect());
            if (window.navigator.msPointerEnabled)
                for (var f =
                    "undefined" != typeof b.identifier ? b.identifier : "undefined" != typeof b.pointerId ? b.pointerId : 1, j = 0; j < this.touches.length; ++j)
                    if (this.touches[j].identifier == f) {
                        var t = (b.clientY - e.top) / d;
                        this.touches[j].x = (b.clientX - e.left) / c;
                        this.touches[j].y = t
                    }
        }
    })
});
ig.baked = !0;
ig.module("plugins.io.io-manager").requires("plugins.io.storage", "plugins.io.mouse", "plugins.io.keyboard", "plugins.io.gamepad", "plugins.io.multitouch", "plugins.io.multitouch-input", "plugins.io.gamepad-input").defines(function() {
    IoManager = ig.Class.extend({
        storage: null,
        localStorageSupport: !1,
        gamekey: "TeamKaboom",
        mouse: null,
        keyboard: null,
        multitouch: null,
        gamepad: null,
        init: function() {
            ig.multitouchInput = new ig.MultitouchInput;
            ig.gamepadInput = new ig.GamepadInput;
            this.unbindAll();
            this.initStorage();
            this.initMouse();
            this.initKeyboard()
        },
        unbindAll: function() {
            ig.input.unbindAll();
            ig.gamepadInput.unbindAll()
        },
        initStorage: function() {
            this._supportsLocalStorage() && (this.storage = new ig.Storage)
        },
        initMouse: function() {
            this.mouse = new Mouse
        },
        initKeyboard: function() {
            this.keyboard = new Keyboard
        },
        initMultitouch: function() {
            this.multitouch = new Multitouch
        },
        initGamepad: function() {
            this.gamepad = new Gamepad
        },
        press: function(b) {
            return ig.input.pressed(b) || this.gamepad.press(b) ? !0 : !1
        },
        held: function(b) {
            return ig.input.state(b) || this.gamepad.state(b) ?
                !0 : !1
        },
        release: function(b) {
            return ig.input.released(b) || this.gamepad.released(b) ? !0 : !1
        },
        getClickPos: function() {
            return this.mouse.getPos()
        },
        getTouchesPos: function() {
            return this.multitouch.getTouchesPos()
        },
        checkOverlap: function(b, c, d, e, f) {
            return b.x > c + e || b.x < c || b.y > d + f || b.y < d ? !1 : !0
        },
        _supportsLocalStorage: function() {
            try {
                return localStorage.setItem("test", "test"), localStorage.removeItem("test"), this.localStorageSupport = "localStorage" in window && null !== window.localStorage
            } catch (b) {
                return this.localStorageSupport
            }
        },
        storageIsSet: function(b) {
            return !this.localStorageSupport ? null : this.storage.isSet(b)
        },
        storageGet: function(b) {
            return !this.localStorageSupport ? null : this.storage.get(b)
        },
        storageSet: function(b, c) {
            if (!this.localStorageSupport) return null;
            this.storage.set(b, c)
        },
        assert: function(b, c, d) {
            if (c !== d) throw "actualValue:" + c + " not equal to testValue:" + d + " at " + b;
        }
    })
});
ig.baked = !0;
ig.module("plugins.splash-loader").requires("impact.loader", "impact.animation").defines(function() {
    ig.SplashLoader = ig.Loader.extend({
        imgPlain: new ig.Image("media/graphics/game/bg_plain_landscape.png"),
        imgTitle: new ig.Image("media/graphics/game/game_title.png"),
        imgBoard: new ig.Image("media/graphics/game/menu_board.png"),
        imgBar: new ig.Image("media/graphics/game/loading_bar.png"),
        init: function(b, c) {
            this.parent(b, c);
            ig.ua.mobile && ig.apiHandler.run("MJSPreroll")
        },
        end: function() {
            this.parent();
            if (ig.ua.mobile) {
                var b =
                    ig.domHandler.getElementById("#play");
                ig.domHandler.show(b)
            }
            b = 0 <= document.URL.indexOf("localhost") ? 500 : 3E3;
            window.setTimeout("ig.system.setGame(MyGame)", b)
        },
        setupCustomAnimation: function() {
            this.customAnim = new ig.Animation(this.customAnim, 0.05, [0, 1, 2, 3, 4, 5]);
            this.customAnim.currentFrame = 0;
            ig.loadingScreen = this;
            ig.loadingScreen.animationTimer = window.setInterval("ig.loadingScreen.animate()", 100)
        },
        animate: function() {
            this.customAnim.currentFrame < this.customAnim.sequence.length ? this.customAnim.currentFrame++ :
                this.customAnim.currentFrame = 0;
            this.customAnim.gotoFrame(this.customAnim.currentFrame)
        },
        drawImgRot: function(b, c, d, e, f) {
            var j = ig.system.context;
            j.save();
            j.translate(c + b.width * e / 2, d + b.height * e / 2);
            j.rotate(f % 360 * Math.PI / 180);
            j.translate(-(c + b.width * e / 2), -(d + b.height * e / 2));
            j.drawImage(b.data, c, d, b.width * e, b.height * e);
            j.restore()
        },
        drawTitle: function() {
            if (ig.ua.mobile) {
                var b = ig.system.context;
                b.save();
                b.drawImage(this.imgTitle.data, 0.5 * ig.system.width - 0.4 * this.imgTitle.width, 0.15 * ig.system.height, 0.8 * this.imgTitle.width,
                    0.8 * this.imgTitle.height);
                b.restore()
            } else this.imgTitle.draw(0.5 * ig.system.width - 0.5 * this.imgTitle.width, 0.15 * ig.system.height)
        },
        drawBackground: function() {
            ig.ua.mobile ? this.drawImgRot(this.imgPlain, -((this.imgPlain.width - this.imgPlain.height) / 2), -((this.imgPlain.height - this.imgPlain.width) / 2), 1, 90) : this.imgPlain.draw(0, 0)
        },
        drawBoard: function() {
            this.imgBoard.draw(0, ig.system.height - this.imgBoard.height)
        },
        drawLoadingBar: function() {
            this.imgBar.draw(0.5 * ig.system.width - 0.5 * this.imgBar.width, 0.55 * ig.system.height);
            var b = ig.system.context;
            b.save();
            b.fillStyle = "rgba(255, 186, 49,1)";
            b.beginPath();
            b.rect(0.5 * ig.system.width - 0.485 * this.imgBar.width, 0.55 * ig.system.height + 0.225 * this.imgBar.height, 0.975 * this.imgBar.width * (this._drawStatus + 0.02).max(1), 0.6 * this.imgBar.height);
            b.fill();
            b.restore();
            b.save();
            b.fillStyle = "rgba(234, 146, 40,1)";
            b.beginPath();
            b.rect(0.5 * ig.system.width - 0.485 * this.imgBar.width, 0.55 * ig.system.height + 0.225 * this.imgBar.height + 0.3 * this.imgBar.height, 0.975 * this.imgBar.width * (this._drawStatus +
                0.02).max(1), 0.6 * this.imgBar.height - 0.3 * this.imgBar.height);
            b.fill();
            b.restore()
        },
        drawPreloadText: function() {
            var b = ig.system.context;
            b.save();
            b.font = "5pt hammer";
            b.fillStyle = "rgba(255,255,255,1)";
            b.textAlign = "center";
            b.fillText("preload font", 800, 800);
            b.restore()
        },
        draw: function() {
            this._drawStatus += (this.status - this._drawStatus) / 5;
            ig.system.context.fillStyle = "#000";
            ig.system.context.fillRect(0, 0, ig.system.width, ig.system.height);
            this.drawBackground();
            this.drawBoard();
            this.drawTitle();
            this.drawLoadingBar();
            this.drawPreloadText()
        }
    })
});
ig.baked = !0;
ig.module("plugins.tween").requires("impact.entity").defines(function() {
    Array.prototype.indexOf || (Array.prototype.indexOf = function(b) {
        for (var c = 0; c < this.length; ++c)
            if (this[c] === b) return c;
        return -1
    });
    ig.Entity.prototype.tweens = [];
    ig.Entity.prototype._preTweenUpdate = ig.Entity.prototype.update;
    ig.Entity.prototype.update = function() {
        this._preTweenUpdate();
        if (0 < this.tweens.length) {
            for (var b = [], c = 0; c < this.tweens.length; c++) this.tweens[c].update(), this.tweens[c].complete || b.push(this.tweens[c]);
            this.tweens =
                b
        }
    };
    ig.Entity.prototype.tween = function(b, c, d) {
        b = new ig.Tween(this, b, c, d);
        this.tweens.push(b);
        return b
    };
    ig.Entity.prototype.pauseTweens = function() {
        for (var b = 0; b < this.tweens.length; b++) this.tweens[b].pause()
    };
    ig.Entity.prototype.resumeTweens = function() {
        for (var b = 0; b < this.tweens.length; b++) this.tweens[b].resume()
    };
    ig.Entity.prototype.stopTweens = function(b) {
        for (var c = 0; c < this.tweens.length; c++) this.tweens[c].stop(b)
    };
    ig.Tween = function(b, c, d, e) {
        var f = {},
            j = {},
            t = {},
            m = 0,
            r = !1,
            x = !1,
            A = !1;
        this.duration = d;
        this.paused =
            this.complete = !1;
        this.easing = ig.Tween.Easing.Linear.EaseNone;
        this.onComplete = !1;
        this.loop = this.delay = 0;
        this.loopCount = -1;
        ig.merge(this, e);
        this.loopNum = this.loopCount;
        this.chain = function(b) {
            A = b
        };
        this.initEnd = function(b, c, d) {
            if ("object" !== typeof c[b]) d[b] = c[b];
            else
                for (subprop in c[b]) d[b] || (d[b] = {}), this.initEnd(subprop, c[b], d[b])
        };
        this.initStart = function(b, c, d, e) {
            if ("object" !== typeof d[b]) "undefined" !== typeof c[b] && (e[b] = d[b]);
            else
                for (subprop in d[b]) e[b] || (e[b] = {}), "undefined" !== typeof c[b] && this.initStart(subprop,
                    c[b], d[b], e[b])
        };
        this.start = function() {
            this.paused = this.complete = !1;
            this.loopNum = this.loopCount;
            m = 0; - 1 == b.tweens.indexOf(this) && b.tweens.push(this);
            x = !0;
            r = new ig.Timer;
            for (var d in c) this.initEnd(d, c, j);
            for (d in j) this.initStart(d, j, b, f), this.initDelta(d, t, b, j)
        };
        this.initDelta = function(b, c, d, e) {
            if ("object" !== typeof e[b]) c[b] = e[b] - d[b];
            else
                for (subprop in e[b]) c[b] || (c[b] = {}), this.initDelta(subprop, c[b], d[b], e[b])
        };
        this.propUpdate = function(b, c, d, e, f) {
            if ("object" !== typeof d[b]) c[b] = "undefined" != typeof d[b] ?
                d[b] + e[b] * f : c[b];
            else
                for (subprop in d[b]) this.propUpdate(subprop, c[b], d[b], e[b], f)
        };
        this.propSet = function(b, c, d) {
            if ("object" !== typeof c[b]) d[b] = c[b];
            else
                for (subprop in c[b]) d[b] || (d[b] = {}), this.propSet(subprop, c[b], d[b])
        };
        this.update = function() {
            if (!x) return !1;
            if (this.delay) {
                if (r.delta() < this.delay) return;
                this.delay = 0;
                r.reset()
            }
            if (this.paused || this.complete) return !1;
            var c = (r.delta() + m) / this.duration,
                c = 1 < c ? 1 : c,
                d = this.easing(c);
            for (property in t) this.propUpdate(property, b, f, t, d);
            if (1 <= c) {
                if (0 == this.loopNum ||
                    !this.loop) {
                    this.complete = !0;
                    if (this.onComplete) this.onComplete();
                    A && A.start();
                    return !1
                }
                if (this.loop == ig.Tween.Loop.Revert) {
                    for (property in f) this.propSet(property, f, b);
                    m = 0;
                    r.reset(); - 1 != this.loopNum && this.loopNum--
                } else if (this.loop == ig.Tween.Loop.Reverse) {
                    c = {};
                    d = {};
                    ig.merge(c, j);
                    ig.merge(d, f);
                    ig.merge(f, c);
                    ig.merge(j, d);
                    for (property in j) this.initDelta(property, t, b, j);
                    m = 0;
                    r.reset(); - 1 != this.loopNum && this.loopNum--
                }
            }
        };
        this.pause = function() {
            this.paused = !0;
            m += r.delta()
        };
        this.resume = function() {
            this.paused = !1;
            r.reset()
        };
        this.stop = function(b) {
            b && (this.loop = this.complete = this.paused = !1, m += d, this.update());
            this.complete = !0
        }
    };
    ig.Tween.Loop = {
        Revert: 1,
        Reverse: 2
    };
    ig.Tween.Easing = {
        Linear: {},
        Quadratic: {},
        Cubic: {},
        Quartic: {},
        Quintic: {},
        Sinusoidal: {},
        Exponential: {},
        Circular: {},
        Elastic: {},
        Back: {},
        Bounce: {}
    };
    ig.Tween.Easing.Linear.EaseNone = function(b) {
        return b
    };
    ig.Tween.Easing.Quadratic.EaseIn = function(b) {
        return b * b
    };
    ig.Tween.Easing.Quadratic.EaseOut = function(b) {
        return -b * (b - 2)
    };
    ig.Tween.Easing.Quadratic.EaseInOut =
        function(b) {
            return 1 > (b *= 2) ? 0.5 * b * b : -0.5 * (--b * (b - 2) - 1)
        };
    ig.Tween.Easing.Cubic.EaseIn = function(b) {
        return b * b * b
    };
    ig.Tween.Easing.Cubic.EaseOut = function(b) {
        return --b * b * b + 1
    };
    ig.Tween.Easing.Cubic.EaseInOut = function(b) {
        return 1 > (b *= 2) ? 0.5 * b * b * b : 0.5 * ((b -= 2) * b * b + 2)
    };
    ig.Tween.Easing.Quartic.EaseIn = function(b) {
        return b * b * b * b
    };
    ig.Tween.Easing.Quartic.EaseOut = function(b) {
        return -(--b * b * b * b - 1)
    };
    ig.Tween.Easing.Quartic.EaseInOut = function(b) {
        return 1 > (b *= 2) ? 0.5 * b * b * b * b : -0.5 * ((b -= 2) * b * b * b - 2)
    };
    ig.Tween.Easing.Quintic.EaseIn =
        function(b) {
            return b * b * b * b * b
        };
    ig.Tween.Easing.Quintic.EaseOut = function(b) {
        return (b -= 1) * b * b * b * b + 1
    };
    ig.Tween.Easing.Quintic.EaseInOut = function(b) {
        return 1 > (b *= 2) ? 0.5 * b * b * b * b * b : 0.5 * ((b -= 2) * b * b * b * b + 2)
    };
    ig.Tween.Easing.Sinusoidal.EaseIn = function(b) {
        return -Math.cos(b * Math.PI / 2) + 1
    };
    ig.Tween.Easing.Sinusoidal.EaseOut = function(b) {
        return Math.sin(b * Math.PI / 2)
    };
    ig.Tween.Easing.Sinusoidal.EaseInOut = function(b) {
        return -0.5 * (Math.cos(Math.PI * b) - 1)
    };
    ig.Tween.Easing.Exponential.EaseIn = function(b) {
        return 0 == b ? 0 : Math.pow(2,
            10 * (b - 1))
    };
    ig.Tween.Easing.Exponential.EaseOut = function(b) {
        return 1 == b ? 1 : -Math.pow(2, -10 * b) + 1
    };
    ig.Tween.Easing.Exponential.EaseInOut = function(b) {
        return 0 == b ? 0 : 1 == b ? 1 : 1 > (b *= 2) ? 0.5 * Math.pow(2, 10 * (b - 1)) : 0.5 * (-Math.pow(2, -10 * (b - 1)) + 2)
    };
    ig.Tween.Easing.Circular.EaseIn = function(b) {
        return -(Math.sqrt(1 - b * b) - 1)
    };
    ig.Tween.Easing.Circular.EaseOut = function(b) {
        return Math.sqrt(1 - --b * b)
    };
    ig.Tween.Easing.Circular.EaseInOut = function(b) {
        return 1 > (b /= 0.5) ? -0.5 * (Math.sqrt(1 - b * b) - 1) : 0.5 * (Math.sqrt(1 - (b -= 2) * b) + 1)
    };
    ig.Tween.Easing.Elastic.EaseIn =
        function(b) {
            var c, d = 0.1,
                e = 0.4;
            if (0 == b) return 0;
            if (1 == b) return 1;
            e || (e = 0.3);
            !d || 1 > d ? (d = 1, c = e / 4) : c = e / (2 * Math.PI) * Math.asin(1 / d);
            return -(d * Math.pow(2, 10 * (b -= 1)) * Math.sin(2 * (b - c) * Math.PI / e))
        };
    ig.Tween.Easing.Elastic.EaseOut = function(b) {
        var c, d = 0.1,
            e = 0.4;
        if (0 == b) return 0;
        if (1 == b) return 1;
        e || (e = 0.3);
        !d || 1 > d ? (d = 1, c = e / 4) : c = e / (2 * Math.PI) * Math.asin(1 / d);
        return d * Math.pow(2, -10 * b) * Math.sin(2 * (b - c) * Math.PI / e) + 1
    };
    ig.Tween.Easing.Elastic.EaseInOut = function(b) {
        var c, d = 0.1,
            e = 0.4;
        if (0 == b) return 0;
        if (1 == b) return 1;
        e || (e = 0.3);
        !d || 1 > d ? (d = 1, c = e / 4) : c = e / (2 * Math.PI) * Math.asin(1 / d);
        return 1 > (b *= 2) ? -0.5 * d * Math.pow(2, 10 * (b -= 1)) * Math.sin(2 * (b - c) * Math.PI / e) : 0.5 * d * Math.pow(2, -10 * (b -= 1)) * Math.sin(2 * (b - c) * Math.PI / e) + 1
    };
    ig.Tween.Easing.Back.EaseIn = function(b) {
        return b * b * (2.70158 * b - 1.70158)
    };
    ig.Tween.Easing.Back.EaseOut = function(b) {
        return (b -= 1) * b * (2.70158 * b + 1.70158) + 1
    };
    ig.Tween.Easing.Back.EaseInOut = function(b) {
        return 1 > (b *= 2) ? 0.5 * b * b * (3.5949095 * b - 2.5949095) : 0.5 * ((b -= 2) * b * (3.5949095 * b + 2.5949095) + 2)
    };
    ig.Tween.Easing.Bounce.EaseIn =
        function(b) {
            return 1 - ig.Tween.Easing.Bounce.EaseOut(1 - b)
        };
    ig.Tween.Easing.Bounce.EaseOut = function(b) {
        return (b /= 1) < 1 / 2.75 ? 7.5625 * b * b : b < 2 / 2.75 ? 7.5625 * (b -= 1.5 / 2.75) * b + 0.75 : b < 2.5 / 2.75 ? 7.5625 * (b -= 2.25 / 2.75) * b + 0.9375 : 7.5625 * (b -= 2.625 / 2.75) * b + 0.984375
    };
    ig.Tween.Easing.Bounce.EaseInOut = function(b) {
        return 0.5 > b ? 0.5 * ig.Tween.Easing.Bounce.EaseIn(2 * b) : 0.5 * ig.Tween.Easing.Bounce.EaseOut(2 * b - 1) + 0.5
    }
});
ig.baked = !0;
ig.module("plugins.url-parameters").defines(function() {
    ig.UrlParameters = ig.Class.extend({
        init: function() {
            switch (getQueryVariable("iphone")) {
                case "true":
                    ig.ua.iPhone = !0, console.log("iPhone mode")
            }
            var b = getQueryVariable("webview");
            if (b) switch (b) {
                case "true":
                    ig.ua.is_uiwebview = !0, console.log("webview mode")
            }
            if (b = getQueryVariable("debug")) switch (b) {
                case "true":
                    ig.game.showDebugMenu(), console.log("debug mode")
            }
            switch (getQueryVariable("view")) {
                case "stats":
                    ig.game.resetPlayerStats(), ig.game.endGame()
            }
            getQueryVariable("ad")
        }
    })
});
ig.baked = !0;
ig.module("plugins.director").requires("impact.impact").defines(function() {
    ig.Director = ig.Class.extend({
        init: function(b, c) {
            this.game = b;
            this.levels = [];
            this.currentLevel = 0;
            this.append(c)
        },
        loadLevel: function(b) {
            for (var c in ig.sizeHandler.dynamicClickableEntityDivs) {
                var d = ig.domHandler.getElementById("#" + c);
                ig.domHandler.hide(d)
            }
            this.currentLevel = b;
            this.game.loadLevel(this.levels[b]);
            return !0
        },
        loadLevelWithoutEntities: function(b) {
            this.currentLevel = b;
            this.game.loadLevelWithoutEntities(this.levels[b]);
            return !0
        },
        append: function(b) {
            newLevels = [];
            return "object" === typeof b ? (b.constructor === [].constructor ? newLevels = b : newLevels[0] = b, this.levels = this.levels.concat(newLevels), !0) : !1
        },
        nextLevel: function() {
            return this.currentLevel + 1 < this.levels.length ? this.loadLevel(this.currentLevel + 1) : !1
        },
        previousLevel: function() {
            return 0 <= this.currentLevel - 1 ? this.loadLevel(this.currentLevel - 1) : !1
        },
        jumpTo: function(b) {
            var c = null;
            for (i = 0; i < this.levels.length; i++) this.levels[i] == b && (c = i);
            return 0 <= c ? this.loadLevel(c) : !1
        },
        firstLevel: function() {
            return this.loadLevel(0)
        },
        lastLevel: function() {
            return this.loadLevel(this.levels.length - 1)
        },
        reloadLevel: function() {
            return this.loadLevel(this.currentLevel)
        }
    })
});
ig.baked = !0;
ig.module("plugins.impact-storage").requires("impact.game").defines(function() {
    ig.Storage = ig.Class.extend({
        staticInstantiate: function() {
            return !ig.Storage.instance ? null : ig.Storage.instance
        },
        init: function() {
            ig.Storage.instance = this
        },
        isCapable: function() {
            return "undefined" !== typeof window.localStorage
        },
        isSet: function(b) {
            return null !== this.get(b)
        },
        initUnset: function(b, c) {
            null === this.get(b) && this.set(b, c)
        },
        get: function(b) {
            if (!this.isCapable()) return null;
            try {
                return JSON.parse(localStorage.getItem(b))
            } catch (c) {
                return window.localStorage.getItem(b)
            }
        },
        getInt: function(b) {
            return ~~this.get(b)
        },
        getFloat: function(b) {
            return parseFloat(this.get(b))
        },
        getBool: function(b) {
            return !!this.get(b)
        },
        key: function(b) {
            return this.isCapable() ? window.localStorage.key(b) : null
        },
        set: function(b, c) {
            if (!this.isCapable()) return null;
            try {
                window.localStorage.setItem(b, JSON.stringify(c))
            } catch (d) {
                console.log(d)
            }
        },
        setHighest: function(b, c) {
            c > this.getFloat(b) && this.set(b, c)
        },
        remove: function(b) {
            if (!this.isCapable()) return null;
            window.localStorage.removeItem(b)
        },
        clear: function() {
            if (!this.isCapable()) return null;
            window.localStorage.clear()
        }
    })
});
this.START_BRANDING_SPLASH;
ig.baked = !0;
ig.module("plugins.branding.splash").requires("impact.impact", "impact.entity").defines(function() {
    ig.BrandingSplash = ig.Class.extend({
        init: function() {
            ig.game.spawnEntity(EntityBranding, 0, 0);
            console.log("spawn branding")
        }
    });
    EntityBranding = ig.Entity.extend({
        gravityFactor: 0,
        size: {
            x: 32,
            y: 32
        },
        splash: new ig.Image("branding/splash1.png"),
        init: function(b, c, d) {
            this.parent(b, c, d);
            320 >= ig.system.width ? (this.size.x = 320, this.size.y = 200) : (this.size.x = 480, this.size.y = 240);
            this.pos.x = (ig.system.width - this.size.x) /
                2;
            this.pos.y = -this.size.y - 200;
            this.endPosY = (ig.system.height - this.size.y) / 2;
            b = this.tween({
                pos: {
                    y: this.endPosY
                }
            }, 0.5, {
                easing: ig.Tween.Easing.Bounce.EaseIn
            });
            c = this.tween({}, 2.5, {
                onComplete: function() {
                    ig.game.director.loadLevel(ig.game.director.currentLevel)
                }
            });
            b.chain(c);
            b.start();
            this.currentAnim = this.anims.idle
        },
        createClickableLayer: function() {
            console.log("Build clickable layer");
            this.checkClickableLayer("branding-splash", _SETTINGS.Branding.Logo.Link, _SETTINGS.Branding.Logo.NewWindow)
        },
        doesClickableLayerExist: function(b) {
            for (k in dynamicClickableEntityDivs)
                if (k ==
                    b) return !0;
            return !1
        },
        checkClickableLayer: function(b, c, d) {
            "undefined" == typeof wm && (this.doesClickableLayerExist(b) ? (ig.game.showOverlay([b]), $("#" + b).find("[href]").attr("href", c)) : this.createClickableOutboundLayer(b, c, "media/graphics/misc/invisible.png", d))
        },
        createClickableOutboundLayer: function(b, c, d, e) {
            var f = ig.$new("div");
            f.id = b;
            document.body.appendChild(f);
            f = $("#" + f.id);
            f.css("float", "left");
            f.css("position", "absolute");
            if (ig.ua.mobile) {
                var j = window.innerHeight / mobileHeight,
                    t = window.innerWidth /
                    mobileWidth;
                f.css("left", this.pos.x * t);
                f.css("top", this.pos.y * j);
                f.css("width", this.size.x * t);
                f.css("height", this.size.y * j)
            } else j = w / 2 - destW / 2, t = h / 2 - destH / 2, console.log(j, t), f.css("left", j + this.pos.x * multiplier), f.css("top", t + this.pos.y * multiplier), f.css("width", this.size.x * multiplier), f.css("height", this.size.y * multiplier);
            e ? f.html("<a target='_blank' href='" + c + "'><img style='width:100%;height:100%' src='" + d + "'></a>") : f.html("<a href='" + c + "'><img style='width:100%;height:100%' src='" + d + "'></a>");
            dynamicClickableEntityDivs[b] = {};
            dynamicClickableEntityDivs[b].width = this.size.x * multiplier;
            dynamicClickableEntityDivs[b].height = this.size.y * multiplier;
            dynamicClickableEntityDivs[b].entity_pos_x = this.pos.x;
            dynamicClickableEntityDivs[b].entity_pos_y = this.pos.y
        },
        draw: function() {
            ig.system.context.fillStyle = "#ffffff";
            ig.system.context.fillRect(0, 0, ig.system.width, ig.system.height);
            ig.system.context.fillStyle = "#000";
            ig.system.context.font = "12px Arial";
            ig.system.context.textAlign = "left";
            320 >= ig.system.width ?
                ig.system.context.fillText("powered by MarketJS.com", ig.system.width - 150, ig.system.height - 15) : ig.system.context.fillText("powered by MarketJS.com", ig.system.width - 160, ig.system.height - 15);
            this.parent();
            this.splash && ig.system.context.drawImage(this.splash.data, 0, 0, this.splash.data.width, this.splash.data.height, this.pos.x, this.pos.y, this.size.x, this.size.y)
        }
    })
});
this.END_BRANDING_SPLASH;
ig.baked = !0;
ig.module("game.entities.buttons.button").requires("impact.entity", "plugins.data.vector").defines(function() {
    EntityButton = ig.Entity.extend({
        collides: ig.Entity.COLLIDES.NEVER,
        type: ig.Entity.TYPE.A,
        size: new Vector2(48, 48),
        fillColor: null,
        zIndex: 95E3,
        init: function(b, c, d) {
            this.parent(b, c, d);
            !ig.global.wm && !isNaN(d.zIndex) && (this.zIndex = d.zIndex);
            b = Math.floor(256 * Math.random());
            c = Math.floor(256 * Math.random());
            d = Math.floor(256 * Math.random());
            this.fillColor = "rgba(" + b + "," + d + "," + c + ",1)"
        },
        clicked: function() {
            throw "no implementation on clicked()";
        },
        clicking: function() {
            throw "no implementation on clicking()";
        },
        released: function() {
            throw "no implementation on released()";
        }
    })
});
ig.baked = !0;
ig.module("plugins.clickable-div-layer").requires("plugins.data.vector").defines(function() {
    ClickableDivLayer = ig.Class.extend({
        pos: new Vector2(0, 0),
        size: new Vector2(0, 0),
        identifier: null,
        invisImagePath: "media/graphics/misc/invisible.png",
        init: function(b) {
            this.pos = new Vector2(b.pos.x, b.pos.y);
            this.size = new Vector2(b.size.x, b.size.y);
            var c = "more-games",
                d = "www.google.com",
                e = !1;
            b.div_layer_name && (c = b.div_layer_name);
            b.link && (d = b.link);
            b.newWindow && (e = b.newWindow);
            this.createClickableLayer(c, d, e)
        },
        createClickableLayer: function(b,
            c, d) {
            this.identifier = b;
            var e = ig.domHandler.getElementById("#" + b);
            e ? (ig.domHandler.show(e), ig.domHandler.attr(e, "href", c)) : this.createClickableOutboundLayer(b, c, this.invisImagePath, d)
        },
        update: function(b, c) {
            this.pos.x === b && this.pos.y === c || (ig.sizeHandler.dynamicClickableEntityDivs[this.identifier] = {}, ig.sizeHandler.dynamicClickableEntityDivs[this.identifier].width = this.size.x, ig.sizeHandler.dynamicClickableEntityDivs[this.identifier].height = this.size.y, ig.sizeHandler.dynamicClickableEntityDivs[this.identifier].entity_pos_x =
                this.pos.x, ig.sizeHandler.dynamicClickableEntityDivs[this.identifier].entity_pos_y = this.pos.y)
        },
        createClickableOutboundLayer: function(b, c, d, e) {
            var f = ig.domHandler.create("div");
            ig.domHandler.attr(f, "id", b);
            var j = ig.domHandler.create("a");
            e ? (ig.domHandler.attr(j, "href", c), ig.domHandler.attr(j, "target", "_blank")) : ig.domHandler.attr(j, "href", c);
            c = ig.domHandler.create("img");
            ig.domHandler.css(c, {
                width: "100%",
                height: "100%"
            });
            ig.domHandler.attr(c, "src", d);
            d = Math.min(ig.sizeHandler.scaleRatioMultiplier.x,
                ig.sizeHandler.scaleRatioMultiplier.y);
            if (ig.ua.mobile) {
                e = Math.floor(this.pos.x * ig.sizeHandler.scaleRatioMultiplier.x) + "px";
                var t = Math.floor(this.pos.y * ig.sizeHandler.scaleRatioMultiplier.y) + "px",
                    m = Math.floor(this.size.x * ig.sizeHandler.scaleRatioMultiplier.x) + "px";
                d = Math.floor(this.size.y * ig.sizeHandler.scaleRatioMultiplier.y) + "px"
            } else e = ig.domHandler.getElementById("#canvas"), e = ig.domHandler.getOffsets(e), t = e.top, e = Math.floor(e.left + this.pos.x * d) + "px", t = Math.floor(t + this.pos.y * d) + "px", m = Math.floor(this.size.x *
                d) + "px", d = Math.floor(this.size.y * d) + "px";
            ig.domHandler.css(f, {
                "float": "left",
                position: "absolute",
                left: e,
                top: t,
                width: m,
                height: d,
                "z-index": 3
            });
            ig.domHandler.addEvent(f, "mousemove", ig.input.mousemove.bind(ig.input), !1);
            ig.domHandler.appendChild(j, c);
            ig.domHandler.appendChild(f, j);
            ig.domHandler.appendToBody(f);
            ig.sizeHandler.dynamicClickableEntityDivs[b] = {};
            ig.sizeHandler.dynamicClickableEntityDivs[b].width = this.size.x;
            ig.sizeHandler.dynamicClickableEntityDivs[b].height = this.size.y;
            ig.sizeHandler.dynamicClickableEntityDivs[b].entity_pos_x =
                this.pos.x;
            ig.sizeHandler.dynamicClickableEntityDivs[b].entity_pos_y = this.pos.y
        }
    })
});
ig.baked = !0;
ig.module("game.entities.buttons.button-branding-logo").requires("game.entities.buttons.button", "plugins.clickable-div-layer").defines(function() {
    EntityButtonBrandingLogo = EntityButton.extend({
        type: ig.Entity.TYPE.A,
        gravityFactor: 0,
        logo: new ig.AnimationSheet("branding/logo.png", _SETTINGS.Branding.Logo.Width, _SETTINGS.Branding.Logo.Height),
        zIndex: 10001,
        size: {
            x: 64,
            y: 66
        },
        clickableLayer: null,
        link: null,
        newWindow: !1,
        div_layer_name: "branding-logo",
        name: "brandinglogo",
        init: function(b, c, d) {
            this.parent(b, c, d);
            if (!ig.global.wm) {
                if ("undefined" == typeof wm)
                    if (_SETTINGS.Branding.Logo.Enabled) this.size.x = _SETTINGS.Branding.Logo.Width, this.size.y = _SETTINGS.Branding.Logo.Height, this.anims.idle = new ig.Animation(this.logo, 0, [0], !0), this.currentAnim = this.anims.idle, d && d.centralize && (this.pos.x = ig.system.width / 2 - this.size.x / 2, console.log("centralize true ... centering branded logo ...")), _SETTINGS.Branding.Logo.LinkEnabled && (this.link = _SETTINGS.Branding.Logo.Link, this.newWindow = _SETTINGS.Branding.Logo.NewWindow, this.clickableLayer =
                        new ClickableDivLayer(this));
                    else {
                        this.kill();
                        return
                    }
                this.div_layer_name = d.div_layer_name ? d.div_layer_name : "branding-logo"
            }
        },
        show: function() {
            var b = ig.domHandler.getElementById("#" + this.div_layer_name);
            ig.domHandler.show(b)
        },
        hide: function() {
            var b = ig.domHandler.getElementById("#" + this.div_layer_name);
            ig.domHandler.hide(b)
        },
        clicked: function() {},
        clicking: function() {},
        released: function() {}
    })
});
ig.baked = !0;
ig.module("game.entities.branding-logo-placeholder").requires("impact.entity", "game.entities.buttons.button-branding-logo").defines(function() {
    EntityBrandingLogoPlaceholder = ig.Entity.extend({
        gravityFactor: 0,
        size: {
            x: 32,
            y: 32
        },
        _wmDrawBox: !0,
        _wmBoxColor: "rgba(0, 0, 255, 0.7)",
        init: function(b, c, d) {
            this.parent(b, c, d);
            if (d) switch (console.log("settings found ... using that div layer name"), b = d.div_layer_name, console.log("settings.centralize:", d.centralize), d.centralize) {
                case "true":
                    console.log("centralize true");
                    centralize = !0;
                    break;
                case "false":
                    console.log("centralize false");
                    centralize = !1;
                    break;
                default:
                    console.log("default ... centralize false"), centralize = !1
            } else b = "branding-logo", centralize = !1;
            if ("undefined" == typeof wm) {
                if (_SETTINGS.Branding.Logo.Enabled) try {
                    ig.game.spawnEntity(EntityButtonBrandingLogo, this.pos.x, this.pos.y, {
                        div_layer_name: b,
                        centralize: centralize
                    })
                } catch (e) {
                    console.log(e)
                }
                this.kill()
            }
        }
    })
});
ig.baked = !0;
ig.module("game.entities.buttons.button-more-games").requires("game.entities.buttons.button", "plugins.clickable-div-layer").defines(function() {
    EntityButtonMoreGames = EntityButton.extend({
        type: ig.Entity.TYPE.A,
        gravityFactor: 0,
        logo: new ig.AnimationSheet("media/graphics/game/button_more_games.png", 129, 46),
        size: {
            x: 129,
            y: 46
        },
        zIndex: 750,
        clickableLayer: null,
        link: null,
        newWindow: !1,
        div_layer_name: "more-games",
        name: "moregames",
        oriPos: {
            x: 0,
            y: 0
        },
        init: function(b, c, d) {
            this.parent(b, c, d);
            ig.global.wm || (this.div_layer_name =
                d.div_layer_name ? d.div_layer_name : "more-games", _SETTINGS.MoreGames.Enabled ? (this.anims.idle = new ig.Animation(this.logo, 0, [0], !0), this.currentAnim = this.anims.idle, this.offset.x = this.currentAnim.sheet.width, _SETTINGS.MoreGames.Link && (this.link = _SETTINGS.MoreGames.Link), _SETTINGS.MoreGames.NewWindow && (this.newWindow = _SETTINGS.MoreGames.NewWindow), this.clickableLayer = new ClickableDivLayer(this), this.tweenTransition()) : this.kill())
        },
        tweenTransition: function() {
            this.tween({
                offset: {
                    x: 0
                }
            }, 0.2, {
                easing: ig.Tween.Easing.Linear.EaseNone
            }).start()
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.currentAnim.alpha = this.touches(b) ? 0.925 : 1)
            }
        },
        update: function() {
            ig.global.wm || (this.updateMouseOver(), this.parent())
        },
        show: function() {
            var b = ig.domHandler.getElementById("#" + this.div_layer_name);
            ig.domHandler.show(b)
        },
        hide: function() {
            var b = ig.domHandler.getElementById("#" + this.div_layer_name);
            ig.domHandler.hide(b)
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click")
        },
        clicking: function() {},
        released: function() {}
    })
});
ig.baked = !0;
ig.module("game.entities.opening-shield").requires("impact.entity").defines(function() {
    EntityOpeningShield = ig.Entity.extend({
        size: {
            x: 48,
            y: 48
        },
        move: 0,
        mIconAnim: 0,
        shieldAnim: 0,
        titleAnim: 0,
        shieldImage: new ig.Image("media/graphics/opening/shield.png"),
        mIconImage: new ig.Image("media/graphics/opening/m_icon.png"),
        titleImage: new ig.Image("media/graphics/opening/title.png"),
        init: function(b, c, d) {
            this.parent(b, c, d)
        },
        ready: function() {
            if (!ig.wm)
                if (_SETTINGS.DeveloperBranding.Splash.Enabled) {
                    this.initTimer = new ig.Timer(0.1);
                    try {
                        ig.soundHandler.playSound(ig.soundHandler.SOUNDID.openingSound)
                    } catch (b) {
                        console.log(b)
                    }
                } else ig.game.director.nextLevel(), ig.system.context.globalAlpha = 1, this.kill()
        },
        update: function() {
            this.parent();
            this.updateOriginalShieldOpening()
        },
        draw: function() {
            this.parent();
            ig.global.wm || (this.nextLevelTimer && 0 > this.nextLevelTimer.delta() && (ig.system.context.globalAlpha = -this.nextLevelTimer.delta()), this.drawOriginalShieldOpening())
        },
        updateOriginalShieldOpening: function() {
            this.initTimer && 0 < this.initTimer.delta() &&
                (this.initTimer = null, this.sheildTimer = new ig.Timer(0.05));
            this.sheildTimer && 0 < this.sheildTimer.delta() && (3 > this.shieldAnim ? (this.shieldAnim++, this.sheildTimer.reset()) : (this.sheildTimer = null, this.moveTimer = new ig.Timer(0.0010), this.mIconTimer = new ig.Timer(0.05), this.titleTimer = new ig.Timer(0.15)));
            this.moveTimer && 0 < this.moveTimer.delta() && (this.move += 0.3, this.moveTimer.reset());
            this.mIconTimer && 0 < this.mIconTimer.delta() && (12 > this.mIconAnim ? (this.mIconAnim++, this.moveTimer.reset()) : this.mIconTimer =
                null);
            this.titleTimer && 0 < this.titleTimer.delta() && (11 > this.titleAnim ? (this.titleAnim++, this.titleTimer.reset()) : (this.titleTimer = null, this.nextLevelTimer = new ig.Timer(1)));
            this.nextLevelTimer && 0 < this.nextLevelTimer.delta() && (this.nextLevelTimer = null, ig.game.director.nextLevel(), ig.system.context.globalAlpha = 1)
        },
        drawOriginalShieldOpening: function() {
            if (this.moveTimer) {
                var b = ig.system.context;
                b.save();
                var c = ig.system.width / 2,
                    d = ig.system.height / 2;
                b.translate(c, d);
                b.rotate(this.move * Math.PI / 180);
                b.beginPath();
                b.moveTo(0, 0);
                for (var e = 0, f = 1; 48 >= f; f += 1) b.lineTo(0 + 800 * Math.cos(2 * f * Math.PI / 48), 0 + 800 * Math.sin(2 * f * Math.PI / 48)), e++, 2 == e && (e = 0, b.lineTo(0, 0));
                b.translate(-c, -d);
                c = b.createRadialGradient(c, d, 100, c, d, 250);
                c.addColorStop(0, "rgba(255,255,255,0.1)");
                c.addColorStop(1, "rgba(0,0,0,0)");
                b.fillStyle = c;
                b.fill();
                b.restore()
            }
            this.shieldImage.drawTile(ig.system.width / 2 - 91, 0 - (768 - ig.system.height) / 2, this.shieldAnim, 182, 768);
            this.moveTimer && (this.mIconImage.drawTile(ig.system.width / 2 - 96, ig.system.height / 2 - 70, this.mIconAnim,
                166, 160), this.titleImage.drawTile(ig.system.width / 2 - 204, ig.system.height / 2 + 100, this.titleAnim, 409, 76));
            ig.system.context.globalAlpha = 1
        }
    })
});
ig.baked = !0;
ig.module("game.entities.opening-kitty").requires("impact.entity").defines(function() {
    EntityOpeningKitty = ig.Entity.extend({
        size: {
            x: 48,
            y: 48
        },
        kittyAnim: -1,
        kittyImage: new ig.Image("media/graphics/opening/kitty.png"),
        kittyTitleImage: new ig.Image("media/graphics/opening/kittytitle.png"),
        soundKey: "kittyopeningSound",
        init: function(b, c, d) {
            this.parent(b, c, d)
        },
        ready: function() {
            if (!ig.wm)
                if (_SETTINGS.DeveloperBranding.Splash.Enabled) {
                    this.initTimer = new ig.Timer(0.1);
                    try {
                        ig.soundHandler.sfxPlayer.play(this.soundKey)
                    } catch (b) {
                        console.log(b)
                    }
                } else ig.game.director.nextLevel(),
                    ig.system.context.globalAlpha = 1, this.kill()
        },
        update: function() {
            this.parent();
            this.updateKittyOpening()
        },
        draw: function() {
            this.parent();
            ig.global.wm || (this.nextLevelTimer && 0 > this.nextLevelTimer.delta() && (ig.system.context.globalAlpha = -this.nextLevelTimer.delta()), this.drawKittyOpening())
        },
        updateKittyOpening: function() {
            this.initTimer && 0 < this.initTimer.delta() && (this.initTimer = null, this.kittyTimer = new ig.Timer(0.15));
            this.kittyTimer && 0 < this.kittyTimer.delta() && (7 > this.kittyAnim ? (this.kittyAnim++, this.kittyTimer.reset()) :
                (this.kittyTimer = null, this.nextLevelTimer = new ig.Timer(2)));
            this.nextLevelTimer && 0 < this.nextLevelTimer.delta() && (this.nextLevelTimer = null, ig.game.director.nextLevel(), ig.system.context.globalAlpha = 1)
        },
        drawKittyOpening: function() {
            var b = ig.system.context.createLinearGradient(0, 0, 0, ig.system.height);
            b.addColorStop(0, "#ffed94");
            b.addColorStop(1, "#ffcd85");
            ig.system.context.fillStyle = b;
            ig.system.context.fillRect(0, 0, ig.system.width, ig.system.height);
            0 <= this.kittyAnim && (this.kittyImage.drawTile(ig.system.width /
                2 - this.kittyImage.width / 8, ig.system.height / 2 - this.kittyImage.height / 4, this.kittyAnim, 218, 325), this.kittyTitleImage.drawTile(ig.system.width / 2 - this.kittyTitleImage.width / 2, ig.system.height / 2 + this.kittyImage.height / 4 + 10, this.kittyAnim, 380, 37));
            ig.system.context.globalAlpha = 1
        }
    })
});
ig.baked = !0;
ig.module("game.entities.pointer").requires("impact.entity").defines(function() {
    EntityPointer = ig.Entity.extend({
        checkAgainst: ig.Entity.TYPE.BOTH,
        isFirstPressed: !1,
        isPressed: !1,
        isReleased: !1,
        isHovering: !1,
        hoveringItem: null,
        objectArray: [],
        clickedObjectList: [],
        ignorePause: !0,
        zIndex: 5E3,
        size: {
            x: 1,
            y: 1
        },
        check: function(b) {
            this.objectArray.push(b)
        },
        clickObject: function(b) {
            this.isFirstPressed && "function" == typeof b.clicked && (b.clicked(), this.addToClickedObjectList(b));
            this.isPressed && !this.isReleased && "function" ==
                typeof b.clicking && b.clicking();
            this.isReleased && "function" == typeof b.released && (b.released(), this.removeFromClickedObjectList(b))
        },
        refreshPos: function() {
            this.pos = ig.game.io.getClickPos()
        },
        update: function() {
            this.parent();
            this.refreshPos();
            var b = null,
                c = -1;
            for (a = this.objectArray.length - 1; - 1 < a; a--) this.objectArray[a].zIndex > c && (c = this.objectArray[a].zIndex, b = this.objectArray[a]);
            if (null != b) null != this.hoveringItem ? this.hoveringItem != b && ("function" == typeof this.hoveringItem.leave && this.hoveringItem.leave(),
                "function" == typeof b.over && b.over()) : "function" == typeof b.over && b.over(), this.hoveringItem = b, this.clickObject(b), this.objectArray = [];
            else if (null != this.hoveringItem && "function" == typeof this.hoveringItem.leave && (this.hoveringItem.leave(), this.hoveringItem = null), this.isReleased) {
                for (b = 0; b < this.clickedObjectList.length; b++) c = this.clickedObjectList[b], "function" == typeof c.releasedOutside && c.releasedOutside();
                this.clickedObjectList = []
            }
            this.isFirstPressed = ig.input.pressed("click");
            this.isReleased = ig.input.released("click");
            this.isPressed = ig.input.state("click")
        },
        addToClickedObjectList: function(b) {
            this.clickedObjectList.push(b)
        },
        removeFromClickedObjectList: function(b) {
            for (var c = [], d = 0; d < this.clickedObjectList.length; d++) {
                var e = this.clickedObjectList[d];
                e != b && c.push(e)
            }
            this.clickedObjectList = c
        }
    })
});
ig.baked = !0;
ig.module("game.entities.pointer-selector").requires("game.entities.pointer").defines(function() {
    EntityPointerSelector = EntityPointer.extend({
        zIndex: 1E3,
        _wmDrawBox: !0,
        _wmBoxColor: "rgba(0, 0, 255, 0.7)",
        size: {
            x: 20,
            y: 20
        },
        init: function(b, c, d) {
            this.parent(b, c, d)
        }
    })
});
ig.baked = !0;
ig.module("game.entities.select").requires("impact.entity").defines(function() {
    EntitySelect = ig.Entity.extend({
        type: ig.Entity.TYPE.B,
        checkAgainst: ig.Entity.TYPE.A,
        collides: ig.Entity.COLLIDES.NEVER,
        canSelect: !1,
        canSelectTimerDuration: 0.35,
        zIndex: 99999,
        isHovering: !1,
        isSelected: !1,
        init: function(b, c, d) {
            this.parent(b, c, d);
            this.canSelectTimer = new ig.Timer(this.canSelectTimerDuration)
        },
        doesClickableLayerExist: function(b) {
            for (k in dynamicClickableEntityDivs)
                if (k == b) return !0;
            return !1
        },
        checkClickableLayer: function(b,
            c, d) {
            "undefined" == typeof wm && (this.doesClickableLayerExist(b) ? (ig.game.showOverlay([b]), $("#" + b).find("[href]").attr("href", c)) : this.createClickableOutboundLayer(b, c, "media/graphics/misc/invisible.png", d))
        },
        createClickableOutboundLayer: function(b, c, d, e) {
            var f = ig.$new("div");
            f.id = b;
            document.body.appendChild(f);
            $("#" + f.id).css("float", "left");
            $("#" + f.id).css("width", this.size.x * multiplier);
            $("#" + f.id).css("height", this.size.y * multiplier);
            $("#" + f.id).css("position", "absolute");
            var j = w / 2 - destW / 2,
                t = h /
                2 - destH / 2;
            w == mobileWidth ? ($("#" + f.id).css("left", this.pos.x), $("#" + f.id).css("top", this.pos.y)) : ($("#" + f.id).css("left", j + this.pos.x * multiplier), $("#" + f.id).css("top", t + this.pos.y * multiplier));
            e ? $("#" + f.id).html("<a target='_blank' href='" + c + "'><img style='width:100%;height:100%' src='" + d + "'></a>") : $("#" + f.id).html("<a href='" + c + "'><img style='width:100%;height:100%' src='" + d + "'></a>");
            dynamicClickableEntityDivs[b] = {};
            dynamicClickableEntityDivs[b].width = $("#" + f.id).width();
            dynamicClickableEntityDivs[b].height =
                $("#" + f.id).height();
            dynamicClickableEntityDivs[b].entity_pos_x = this.pos.x;
            dynamicClickableEntityDivs[b].entity_pos_y = this.pos.y
        },
        hovered: function() {
            this.isHovering = !0;
            this.dehoverOthers()
        },
        dehoverOthers: function() {
            var b = ig.game.getEntitiesByType(EntitySelect);
            for (i = 0; i < b.length; i++) b[i] != this && (b[i].isHovering = !1)
        },
        deselectOthers: function() {
            var b = ig.game.getEntitiesByType(EntitySelect);
            for (i = 0; i < b.length; i++) b[i] != this && (b[i].isSelected = !1)
        },
        update: function() {
            this.parent();
            this.canSelectTimer && 0 <
                this.canSelectTimer.delta() && (this.canSelect = !0, this.canSelectTimer = null)
        }
    })
});
ig.baked = !0;
ig.module("game.entities.background").requires("impact.entity").defines(function() {
    EntityBackground = ig.Entity.extend({
        zIndex: 10,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgPlain: new ig.Image("media/graphics/game/bg_plain_landscape.png"),
        imgDiamond: new ig.Image("media/graphics/game/bg_diamond_landscape.png"),
        imgRust: new ig.Image("media/graphics/game/bg_rust_landscape.png"),
        imgPlank: new ig.Image("media/graphics/game/bg_plank_landscape.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b,
                    c, d), this.size.x = this.imgPlain.width, this.size.y = this.imgPlain.height, this.oriPos.x = b, this.oriPos.y = c, this.ashPlain = new ig.AnimationSheet(this.imgPlain.path, this.imgPlain.width, this.imgPlain.height), this.ashDiamond = new ig.AnimationSheet(this.imgDiamond.path, this.imgDiamond.width, this.imgDiamond.height), this.ashRust = new ig.AnimationSheet(this.imgRust.path, this.imgRust.width, this.imgRust.height), this.ashPlank = new ig.AnimationSheet(this.imgPlank.path, this.imgPlank.width, this.imgPlank.height), this.anims.plain =
                new ig.Animation(this.ashPlain, 0.1, [0]), this.anims.diamond = new ig.Animation(this.ashDiamond, 0.1, [0]), this.anims.rust = new ig.Animation(this.ashRust, 0.1, [0]), this.anims.plank = new ig.Animation(this.ashPlank, 0.1, [0]), this.getSelectedPattern(), ig.ua.mobile && this.toPortraitMode())
        },
        getSelectedPattern: function() {
            switch (ig.game.getSetting("casualCheckersTheme", "wood")) {
                case "wood":
                    this.currentAnim = this.anims.diamond;
                    break;
                case "teal":
                    this.currentAnim = this.anims.rust;
                    break;
                case "olive":
                    this.currentAnim = this.anims.plank;
                    break;
                default:
                    this.currentAnim = this.anims.diamond
            }
            ig.ua.mobile && this.toPortraitMode()
        },
        toPortraitMode: function() {
            this.offset.x = (this.imgPlain.width - this.imgPlain.height) / 2;
            this.offset.y = (this.imgPlain.height - this.imgPlain.width) / 2;
            this.currentAnim.angle = (90).toRad()
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y =
                this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.gameboard").requires("impact.entity").defines(function() {
    EntityGameboard = ig.Entity.extend({
        zIndex: 50,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgWood: new ig.Image("media/graphics/game/bd_wood.png"),
        imgTeal: new ig.Image("media/graphics/game/bd_teal.png"),
        imgOlive: new ig.Image("media/graphics/game/bd_olive.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashWood = new ig.AnimationSheet(this.imgWood.path, this.imgWood.width,
                this.imgWood.height), this.ashTeal = new ig.AnimationSheet(this.imgTeal.path, this.imgTeal.width, this.imgTeal.height), this.ashOlive = new ig.AnimationSheet(this.imgOlive.path, this.imgOlive.width, this.imgOlive.height), this.anims.wood = new ig.Animation(this.ashWood, 0.1, [0]), this.anims.teal = new ig.Animation(this.ashTeal, 0.1, [0]), this.anims.olive = new ig.Animation(this.ashOlive, 0.1, [0]), this.getSelectedPattern(), this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height)
        },
        getSelectedPattern: function() {
            switch (ig.game.getSetting("casualCheckersTheme",
                "wood")) {
                case "wood":
                    this.currentAnim = this.anims.wood;
                    break;
                case "teal":
                    this.currentAnim = this.anims.teal;
                    break;
                case "olive":
                    this.currentAnim = this.anims.olive;
                    break;
                default:
                    this.currentAnim = this.anims.wood
            }
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm ||
                this.parent()
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.checker").requires("impact.entity").defines(function() {
    EntityChecker = ig.Entity.extend({
        zIndex: 200,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgManBlack: new ig.Image("media/graphics/game/checker_man_black.png"),
        imgManRed: new ig.Image("media/graphics/game/checker_man_red.png"),
        imgKingBlack: new ig.Image("media/graphics/game/checker_king_black.png"),
        imgKingRed: new ig.Image("media/graphics/game/checker_king_red.png"),
        init: function(b, c, d) {
            ig.global.wm ||
                (this.parent(b, c, d), this.oriPos.x = d.ox, this.oriPos.y = d.oy, this.ashManBlack = new ig.AnimationSheet(this.imgManBlack.path, this.imgManBlack.width, this.imgManBlack.height), this.ashManRed = new ig.AnimationSheet(this.imgManRed.path, this.imgManRed.width, this.imgManRed.height), this.ashKingBlack = new ig.AnimationSheet(this.imgKingBlack.path, this.imgKingBlack.width, this.imgKingBlack.height), this.ashKingRed = new ig.AnimationSheet(this.imgKingRed.path, this.imgKingRed.width, this.imgKingRed.height), this.anims.manBlack =
                    new ig.Animation(this.ashManBlack, 0.1, [0]), this.anims.manRed = new ig.Animation(this.ashManRed, 0.1, [0]), this.anims.kingBlack = new ig.Animation(this.ashKingBlack, 0.1, [0]), this.anims.kingRed = new ig.Animation(this.ashKingRed, 0.1, [0]), this.checkerType = d.checkerType, this.row = d.row, this.col = d.col, this.currentAnim = this.anims[this.checkerType], this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.shadow = ig.game.spawnEntity(EntityCheckerShadow, this.pos.x, this.pos.y, {
                        master: this
                    }),
                    this.actionHistory = [], this.pieceArrangement())
        },
        pieceArrangement: function() {
            var b = ig.game.rand(5, 10);
            this.zIndex += b;
            ig.game.sortEntitiesDeferred();
            this.atween = this.tween({
                pos: {
                    x: this.oriPos.x,
                    y: this.oriPos.y
                }
            }, b / 10, {
                easing: ig.Tween.Easing.Linear.EaseNone,
                onComplete: function() {
                    ig.soundHandler.sfxPlayer.play("pieceMove")
                }.bind(this)
            });
            this.atween.start()
        },
        promotedToKing: function(b) {
            ig.soundHandler.sfxPlayer.play("kingFanfare");
            this.promoteToKing();
            this.actionHistory[this.actionHistory.length] = {
                turn: b,
                action: "king"
            }
        },
        promoteToKing: function() {
            switch (this.checkerType) {
                case "manBlack":
                    this.checkerType = "kingBlack";
                    break;
                case "manRed":
                    this.checkerType = "kingRed"
            }
            this.currentAnim = this.anims[this.checkerType]
        },
        demoteToMan: function() {
            switch (this.checkerType) {
                case "kingBlack":
                    this.checkerType = "manBlack";
                    break;
                case "kingRed":
                    this.checkerType = "manRed"
            }
            this.currentAnim = this.anims[this.checkerType]
        },
        kill: function() {
            this.shadow.kill();
            this.parent()
        },
        uncapture: function(b) {
            this.zIndex = 100;
            this.shadow.updateZ();
            ig.game.sortEntitiesDeferred();
            var c = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            this.size.x = this.currentAnim.sheet.width;
            this.size.y = this.currentAnim.sheet.height;
            this.currentAnim.alpha = 1;
            this.row = Math.abs(this.row);
            this.col = Math.abs(this.col);
            this.shadow.uncapture();
            c.lastCapture = b
        },
        capture: function() {
            this.zIndex = 100;
            this.shadow.updateZ();
            ig.game.sortEntitiesDeferred();
            ig.game.getEntitiesByType(EntityGameplayControl)[0].lastCapture = 0;
            this.size.x = 0;
            this.size.y = 0;
            this.currentAnim.alpha = 0;
            this.row = -Math.abs(this.row);
            this.col = -Math.abs(this.col);
            this.shadow.captured()
        },
        captured: function(b) {
            var c = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            this.capture();
            this.actionHistory[this.actionHistory.length] = {
                turn: b,
                action: "capture",
                lastCapture: c.lastCapture
            }
        },
        recordMove: function(b, c, d) {
            var e = !1;
            1 < Math.abs(this.row - b) && (e = !0);
            this.actionHistory[this.actionHistory.length] = {
                turn: d,
                action: "move",
                fr: this.row,
                fc: this.col,
                tr: b,
                tc: c,
                capturing: e
            };
            this.row = b;
            this.col = c
        },
        historyMove: function(b,
            c, d) {
            var e = ig.game.getArea(b, c);
            d && (this.zIndex = 200, this.shadow.updateZ(), ig.game.sortEntitiesDeferred());
            e && (ig.game.deselectAll(), this.tween({
                pos: {
                    x: e.pos.x + ig.game.gapX,
                    y: e.pos.y + ig.game.gapY
                }
            }, 0.2, {
                easing: ig.Tween.Easing.Linear.EaseNone,
                onComplete: function() {
                    ig.soundHandler.sfxPlayer.play("pieceMove")
                }.bind(this)
            }).start());
            this.row = b;
            this.col = c
        },
        playerMove: function(b, c) {
            this.zIndex = 200;
            this.shadow.updateZ();
            ig.game.sortEntitiesDeferred();
            var d = ig.game.getArea(b, c);
            if (d) {
                ig.game.deselectAll();
                this.tween({
                    pos: {
                        x: d.pos.x + ig.game.gapX,
                        y: d.pos.y + ig.game.gapY
                    }
                }, 0.2, {
                    easing: ig.Tween.Easing.Linear.EaseNone,
                    onComplete: function() {
                        ig.soundHandler.sfxPlayer.play("pieceMove")
                    }.bind(this)
                }).start();
                d = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                d.lastCapture += 1;
                d.turnCount += 1;
                var e = d.boardMgr.move(this.row, this.col, b, c, "entity", d.turnCount);
                this.recordMove(b, c, d.turnCount); - 1 != ig.game.noJumpDraw && d.lastCapture >= ig.game.noJumpDraw && (d.gameEnd = 0);
                e ? d.gameEnd = d.boardMgr.player : (e = new ClassMoveList(ig.game.BoardArea),
                    d.boardMgr.fillMoveList(e), e.length || (d.gameEnd = d.boardMgr.player ^ 1));
                d.aiTimer.set()
            }
        },
        toggleFromArea: function() {
            ig.game.getEntitiesByType(EntityGameplayControl)[0].boardMgr.getPlayer(this.row, this.col);
            var b = ig.game.getArea(this.row, this.col);
            b && (b.selected = !b.selected);
            if ("" !== ig.game.fromArea.row) {
                var c = ig.game.getArea(ig.game.fromArea.row, ig.game.fromArea.col);
                c && (c.selected = !1)
            }
            ig.game.fromArea = b && b.selected ? {
                row: this.row,
                col: this.col
            } : {
                row: "",
                col: ""
            }
        },
        clicked: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            0 == b.historyQueue.length && b.boardMgr.getPlayer(this.row, this.col) == ig.game.player && ("fullyUp" == b.optionsMenu.state && b.allInPlace()) && this.toggleFromArea()
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.checker-shadow").requires("impact.entity").defines(function() {
    EntityCheckerShadow = ig.Entity.extend({
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/checker_shadow.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.master = d.master, this.zIndex = this.master.zIndex - 1, this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height)
        },
        updateZ: function() {
            this.zIndex = this.master.zIndex - 1
        },
        uncapture: function() {
            this.size.x = this.currentAnim.sheet.width;
            this.size.y = this.currentAnim.sheet.height;
            this.currentAnim.alpha = 1
        },
        captured: function() {
            this.size.x = 0;
            this.size.y = 0;
            this.currentAnim.alpha = 0
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height *
                this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        follow2: function() {
            var b = this.master.pos.x + 1 - this.pos.x,
                c = this.master.pos.y + 3 - this.pos.y;
            1 < Math.sqrt(b * b + c * c) && (this.pos.x += 30 * b * ig.system.tick, this.pos.y += 30 * c * ig.system.tick)
        },
        follow: function() {
            this.pos.x += (this.master.pos.x + 1 - this.pos.x) / 0.04 * ig.system.tick;
            this.pos.y += (this.master.pos.y + 3 - this.pos.y) / 0.04 * ig.system.tick
        },
        update: function() {
            ig.global.wm || (this.follow(),
                this.parent())
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.click-area").requires("impact.entity").defines(function() {
    EntityClickArea = ig.Entity.extend({
        zIndex: 60,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.selected = !1, this.border = 0, this.hintIlluminateRounds = 1.5, this.hintIlluminate = 0, this.hintTimer = new ig.Timer, this.oriPos.x = b, this.oriPos.y = c, this.row = d.row, this.col = d.col, this.size.x = ig.game.squareWidth, this.size.y = ig.game.squareHeight, this.updateColor())
        },
        updateColor: function() {
            var b = ig.game.getSetting("casualCheckersTheme", "wood");
            this.colorCode2 = this.colorCode = "255,255,255";
            switch (b) {
                case "wood":
                    this.colorCode = "255,255,255";
                    break;
                case "teal":
                    this.colorCode = "0,0,0";
                    break;
                case "olive":
                    this.colorCode = "255,255,255"
            }
        },
        validMsg: function(b) {
            var c = "N/A";
            switch (b) {
                case 0:
                    c = "valid";
                    break;
                case 1:
                    c = _STRINGS.Game.Error1;
                    break;
                case 2:
                    c = _STRINGS.Game.Error2;
                    break;
                case 3:
                    c = _STRINGS.Game.Error3;
                    break;
                case 4:
                    c = _STRINGS.Game.Error4;
                    break;
                case 5:
                    c = _STRINGS.Game.Error5;
                    break;
                case 6:
                    c = _STRINGS.Game.Error6;
                    break;
                case 7:
                    c = _STRINGS.Game.Error7;
                    break;
                case 8:
                    c = _STRINGS.Game.Error8;
                    break;
                case 9:
                    c = _STRINGS.Game.Error9
            }
            0 != b && (ig.soundHandler.sfxPlayer.play("invalid"), ig.game.getEntitiesByType(EntityGameplayControl)[0].orderToast(c))
        },
        clicked: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            if ("" !== ig.game.fromArea.row && "fullyUp" == b.optionsMenu.state && b.allInPlace()) {
                var c = b.boardMgr.validateMove(ig.game.fromArea.row, ig.game.fromArea.col, this.row, this.col);
                this.validMsg(c);
                if (0 == c && (c = ig.game.getPiece(ig.game.fromArea.row, ig.game.fromArea.col))) b.truncateHistory(b.turnCount), c.playerMove(this.row, this.col), b.recordHistory()
            }
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        check: function() {},
        drawGlowingBorder: function() {
            3 <= this.border && (this.border = 0);
            var b = Math.floor(this.border),
                c = ig.system.context;
            c.save();
            c.beginPath();
            c.strokeStyle = "rgba(" + this.colorCode + ",1)";
            c.rect(this.pos.x + 0 - b, this.pos.y + 0 - b, this.size.x - 0 + 2 * b, this.size.y - 0 + 2 * b);
            c.lineWidth = 1;
            c.stroke();
            c.restore()
        },
        illuminate: function() {
            this.hintTimer.set();
            this.hintIlluminate = this.hintIlluminateRounds
        },
        drawHintIllumination: function() {
            3 <= this.border && (this.border = 0);
            var b = Math.floor(this.border),
                c = ig.system.context;
            c.save();
            c.beginPath();
            c.strokeStyle = "rgba(" + this.colorCode2 + ",0.35)";
            c.rect(this.pos.x + 0 - b, this.pos.y + 0 - b, this.size.x - 0 + 2 * b, this.size.y - 0 + 2 * b);
            c.lineWidth = 20;
            c.stroke();
            c.restore()
        },
        draw: function() {
            this.parent();
            this.border += 8.5 * ig.system.tick;
            this.selected && this.drawGlowingBorder();
            0 < this.hintIlluminate && this.hintTimer.delta() <= this.hintIlluminate ? this.drawHintIllumination() : this.hintTimer.delta() > this.hintIlluminate && (this.hintIlluminate = 0);
            if (ig.game.boardDebug) {
                var b = ig.system.context;
                b.save();
                b.font =
                    "7pt hammer";
                b.fillStyle = "rgba(255,255,255,1)";
                b.textAlign = "center";
                var c = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                b.fillText(this.row + " " + this.col, this.pos.x + 0.15 * this.size.x, this.pos.y + 0.15 * this.size.y);
                b.fillText(c.boardMgr.coordToIndex(this.row, this.col), this.pos.x + 0.05 * this.size.x, this.pos.y + 0.35 * this.size.y);
                b.restore()
            }
        }
    })
});
ig.baked = !0;
ig.module("game.entities.gameboard-shadow").requires("impact.entity").defines(function() {
    EntityGameboardShadow = ig.Entity.extend({
        zIndex: 40,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/bd_shadow.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]),
                this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.text-display").requires("impact.entity").defines(function() {
    EntityTextDisplay = ig.Entity.extend({
        zIndex: 1E3,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgBlack: new ig.Image("media/graphics/game/checker_man_black.png"),
        imgRed: new ig.Image("media/graphics/game/checker_man_red.png"),
        imgSparkle: new ig.Image("media/graphics/game/sparkle.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.hintSparkSC = 0.25, this.tweenHintSpark())
        },
        tweenHintSpark: function() {
            var b =
                this.tween({
                    hintSparkSC: 1
                }, 1.5, {
                    easing: ig.Tween.Easing.Linear.EaseNone
                }),
                c = this.tween({
                    hintSparkSC: 0.25
                }, 1.5, {
                    easing: ig.Tween.Easing.Linear.EaseNone
                });
            b.chain(c);
            c.chain(b);
            b.start()
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        check: function() {},
        drawBoardDebug: function() {
            if (ig.game.boardDebug) {
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                if (ig.game.player == ig.game.PlayerOne)
                    for (var c = 63, d = b.boardMgr.rows - 1; 0 <= d; d--)
                        for (var e = b.boardMgr.cols - 1; 0 <= e; e--) {
                            c2 = b.boardMgr.cols - 1 - e;
                            r2 = b.boardMgr.rows - 1 - d;
                            var f = b.btlX + c2 * (ig.game.squareWidth + 1.15),
                                j = b.btlY + r2 * (ig.game.squareHeight + 1.15),
                                t = ig.system.context;
                            t.save();
                            t.font = "7pt hammer";
                            t.fillStyle = "rgba(255,255,255,1)";
                            t.textAlign = "center";
                            t.fillText(b.boardMgr.grid[c--],
                                f + 25, j + 25);
                            t.restore()
                        } else
                            for (d = c = 0; d < b.boardMgr.rows; d++)
                                for (e = 0; e < b.boardMgr.cols; e++) f = b.btlX + e * (ig.game.squareWidth + 1.15), j = b.btlY + d * (ig.game.squareHeight + 1.15), t = ig.system.context, t.save(), t.font = "7pt hammer", t.fillStyle = "rgba(255,255,255,1)", t.textAlign = "center", t.fillText(b.boardMgr.grid[c++], f + 25, j + 25), t.restore()
            }
        },
        drawStatsDebug: function() {
            var b = ig.system.context;
            b.save();
            b.font = "15pt hammer";
            b.fillStyle = "rgba(255,255,255,1)";
            b.textAlign = "left";
            var c = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                d = "",
                d = c.boardMgr.player == ig.game.player ? ig.game.playerColor.replace("man", "") : ig.game.opponentColor.replace("man", ""); - 1 == c.gameEnd ? b.fillText(d + "'s turn", 0.765 * ig.system.width, 0.5 * ig.system.height) : 0 == c.gameEnd ? b.fillText("Draw!", 0.765 * ig.system.width, 0.5 * ig.system.height) : b.fillText(ig.game.getPlayerColor(c.gameEnd) + " won!", 0.765 * ig.system.width, 0.5 * ig.system.height);
            b.fillText("Turn " + c.turnCount, 0.765 * ig.system.width, 0.6 * ig.system.height);
            b.restore()
        },
        drawImg: function(b, c, d, e) {
            var f = ig.system.context;
            f.save();
            f.drawImage(b.data, c, d, b.width * e, b.height * e);
            f.restore()
        },
        drawStats: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                c = ig.system.context;
            c.save();
            c.font = "15pt hammer";
            c.fillStyle = "rgba(255,255,255,1)";
            var d = _STRINGS.Game.Turn.replace("@@turnCount@@", b.turnCount);
            if (-1 == b.gameEnd) switch (b.boardMgr.player) {
                case 2:
                case 3:
                    d = b.boardMgr.player == ig.game.player ? d + (" - " + _STRINGS.Game.PlayerTurn) : d + (" - " + _STRINGS.Game.ComputerTurn)
            }
            var e = this.imgRed,
                f = this.imgBlack;
            switch (ig.game.playerColor) {
                case "manBlack":
                    e =
                        this.imgRed;
                    f = this.imgBlack;
                    break;
                case "manRed":
                    e = this.imgBlack, f = this.imgRed
            }
            ig.ua.mobile ? (c.textAlign = "left", this.drawImg(e, 0.075 * ig.system.width, 0.085 * ig.system.height, 0.75), this.drawImg(f, 0.075 * ig.system.width, 0.875 * ig.system.height, 0.75), c.font = "20pt hammer", c.fillText(b.boardMgr.pieceCount[ig.game.player ^ 1], 0.185 * ig.system.width, 0.125 * ig.system.height), c.fillText(b.boardMgr.pieceCount[ig.game.player], 0.185 * ig.system.width, 0.915 * ig.system.height), c.font = "15pt hammer", c.textAlign = "center", "teal" ==
                ig.game.getSetting("casualCheckersTheme", "wood") && (b = 1.05 * c.measureText(d).width, c.save(), c.beginPath(), c.fillStyle = "rgba(0,0,0,0.25)", c.rect(0.5 * ig.system.width - 0.5 * b, 0.0225 * ig.system.height, b, 22.5), c.fill(), c.restore()), c.fillText(d, 0.5 * ig.system.width, 0.05 * ig.system.height)) : (c.textAlign = "left", this.drawImg(e, 0.785 * ig.system.width, 0.175 * ig.system.height, 0.75), this.drawImg(f, 0.785 * ig.system.width, 0.8 * ig.system.height, 0.75), c.font = "20pt hammer", c.fillText(b.boardMgr.pieceCount[ig.game.player ^ 1],
                0.865 * ig.system.width, 0.225 * ig.system.height), c.fillText(b.boardMgr.pieceCount[ig.game.player], 0.865 * ig.system.width, 0.85 * ig.system.height), c.font = "15pt hammer", c.textAlign = "center", "teal" == ig.game.getSetting("casualCheckersTheme", "wood") && (b = c.measureText(d).width, b *= 1.05, c.save(), c.beginPath(), c.fillStyle = "rgba(0,0,0,0.4)", c.rect(0.5 * ig.system.width - 0.5 * b, 0.0025 * ig.system.height, b, 22.5), c.fill(), c.restore()), c.fillText(d, 0.5 * ig.system.width, 0.04 * ig.system.height));
            c.restore()
        },
        drawForceCaptureHint: function() {
            var b =
                ig.game.getEntitiesByType(EntityGameplayControl)[0];
            if (-1 == b.gameEnd && (b.boardMgr.multiTurn && b.boardMgr.player == ig.game.player || b.boardMgr.player == ig.game.player && b.sessionCasualCheckersForceJumps)) {
                if (this.moves || (this.moves = new ClassMoveList(b.boardMgr.area()), b.boardMgr.fillMoveList(this.moves)), this.moves.canCapture) {
                    for (var c = 0, d = 0; d < this.moves.list.length; d++) {
                        var e = this.moves.list,
                            f = e[d] >> 8 & 255,
                            j = e[d] & 255;
                        0 == b.boardMgr.validateMove(e[d] >> 24, e[d] >> 16 & 255, f, j) && (c += 1, ig.game.player == ig.game.PlayerOne &&
                            (f = b.boardMgr.rows - 1 - f, j = b.boardMgr.cols - 1 - j), this.drawImg(this.imgSparkle, b.btlX + j * (ig.game.squareWidth + 1.15) + 0.775 * ig.game.squareWidth - this.imgSparkle.width * this.hintSparkSC / 2, b.btlY + f * (ig.game.squareHeight + 1.15) + 0.225 * ig.game.squareHeight - this.imgSparkle.height * this.hintSparkSC / 2, this.hintSparkSC))
                    }
                    0 == c && (this.moves = "")
                }
            } else this.moves = ""
        },
        drawWinStreak: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            if (0 < b.winStreak.w) {
                var c = ig.system.context;
                c.save();
                c.fillStyle = "rgba(255,255,255,1)";
                ig.ua.mobile ? (c.textAlign = "center", c.font = "12pt hammer", c.fillText(_STRINGS.Game.WinStreak + b.winStreak.w.min(0), 0.5 * ig.system.width, 0.865 * ig.system.height)) : (c.textAlign = "right", c.font = "10pt hammer", c.fillText(_STRINGS.Game.WinStreak + b.winStreak.w.min(0), 0.9825 * ig.system.width, 0.955 * ig.system.height));
                c.restore()
            }
        },
        draw: function() {
            this.parent();
            this.drawStats();
            this.drawBoardDebug();
            this.drawForceCaptureHint();
            this.drawWinStreak()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-undo").requires("impact.entity").defines(function() {
    EntityButtonUndo = ig.Entity.extend({
        zIndex: 1010,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/undo.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.mouseAlpha = 0)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        findClosestPlayerUndoTurn: function() {
            for (var b = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                c = 0, d = b.turnCount - 1; 0 <= d; d--)
                if (c += 1, b.historyStack[d].player == ig.game.player) return c;
            return -1
        },
        clicked: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                c = this.findClosestPlayerUndoTurn();
            if (!b.historying && !b.thinking && (0 < b.undoLeft || -1 == ig.game.undoTimes) && "fullyUp" == b.optionsMenu.state && b.boardMgr.player == ig.game.player && 0 == b.historyQueue.length && -1 == b.gameEnd && -1 != c) ig.soundHandler.sfxPlayer.play("history"), b.undoUntil((b.turnCount - c).min(0)), b.undoLeft -= 1
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b =
                    ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.mouseAlpha = this.touches(b) ? 0.075 : 0)
            }
        },
        update: function() {
            if (!ig.global.wm) {
                this.updateMouseOver();
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                this.currentAnim.alpha = !b.historying && !b.thinking && (0 < b.undoLeft || -1 == ig.game.undoTimes) && "fullyUp" == b.optionsMenu.state && b.boardMgr.player == ig.game.player && 0 == b.historyQueue.length && -1 == b.gameEnd && -1 != this.findClosestPlayerUndoTurn() ? 1 - this.mouseAlpha : 0.5;
                this.parent()
            }
        },
        check: function() {},
        drawUndoCountsLeft: function() {
            if (-1 !=
                ig.game.undoTimes) {
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                    c = ig.system.context;
                c.save();
                c.font = "12pt hammer";
                c.fillStyle = "rgba(255,255,255," + this.currentAnim.alpha + ")";
                c.textAlign = "left";
                c.fillText(b.undoLeft, this.pos.x + 0.1 * this.size.x, this.pos.y + 0.9 * this.size.y);
                c.restore()
            }
        },
        draw: function() {
            this.parent();
            this.drawUndoCountsLeft()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-redo").requires("impact.entity").defines(function() {
    EntityButtonRedo = ig.Entity.extend({
        zIndex: 1020,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/undo.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.currentAnim.angle = (180).toRad(), this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.mouseAlpha = 0)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        findClosestPlayerRedoTurn: function() {
            var b =
                ig.game.getEntitiesByType(EntityGameplayControl)[0];
            if (b.turnCount + 1 >= b.historyStack.length) return -1;
            for (var c = 0, d = b.turnCount + 1; d < b.historyStack.length; d++)
                if (c += 1, b.historyStack[d].player == ig.game.player) return c;
            return -1
        },
        clicked: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                c = this.findClosestPlayerRedoTurn();
            !b.historying && !b.thinking && ("fullyUp" == b.optionsMenu.state && b.boardMgr.player == ig.game.player && -1 != c && -1 == b.gameEnd && 0 == b.historyQueue.length) && (ig.soundHandler.sfxPlayer.play("history"),
                b.redoUntil((b.turnCount + c).max(b.historyStack.length)))
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.mouseAlpha = this.touches(b) ? 0.075 : 0)
            }
        },
        update: function() {
            if (!ig.global.wm) {
                this.updateMouseOver();
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                this.currentAnim.alpha = !b.historying && !b.thinking && "fullyUp" == b.optionsMenu.state && b.boardMgr.player == ig.game.player && 0 == b.historyQueue.length && -1 == b.gameEnd && -1 != this.findClosestPlayerRedoTurn() ?
                    1 - this.mouseAlpha : 0.5;
                this.parent()
            }
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-hint").requires("impact.entity").defines(function() {
    EntityButtonHint = ig.Entity.extend({
        zIndex: 1030,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/hint.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.mouseAlpha = 0)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        clicked: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            if (!b.historying &&
                !b.thinking && (0 < b.hintLeft || -1 == ig.game.hintTimes) && "fullyUp" == b.optionsMenu.state && b.boardMgr.player == ig.game.player && -1 == b.gameEnd && 0 == b.historyQueue.length) ig.soundHandler.sfxPlayer.play("hint"), b.showHint(), b.hintLeft -= 1
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.mouseAlpha = this.touches(b) ? 0.075 : 0)
            }
        },
        update: function() {
            if (!ig.global.wm) {
                this.updateMouseOver();
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                this.currentAnim.alpha = !b.historying && !b.thinking && (0 < b.hintLeft || -1 == ig.game.hintTimes) && "fullyUp" == b.optionsMenu.state && b.boardMgr.player == ig.game.player && -1 == b.gameEnd && 0 == b.historyQueue.length ? 1 - this.mouseAlpha : 0.5;
                this.parent()
            }
        },
        check: function() {},
        drawHintCountsLeft: function() {
            if (-1 != ig.game.hintTimes) {
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                    c = ig.system.context;
                c.save();
                c.font = "12pt hammer";
                c.fillStyle = "rgba(255,255,255," + this.currentAnim.alpha + ")";
                c.textAlign = "left";
                c.fillText(b.hintLeft, this.pos.x +
                    0.1 * this.size.x, this.pos.y + 0.9 * this.size.y);
                c.restore()
            }
        },
        draw: function() {
            this.parent();
            this.drawHintCountsLeft()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-options").requires("impact.entity").defines(function() {
    EntityButtonOptions = ig.Entity.extend({
        zIndex: 1040,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/options.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.mouseAlpha = 0)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        clicked: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            !b.historying &&
                "fullyUp" == b.optionsMenu.state && (!b.thinking && 0 == b.historyQueue.length) && (ig.soundHandler.sfxPlayer.play("click"), b.optionsMenu.pullDownMenu())
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.mouseAlpha = this.touches(b) ? 0.075 : 0)
            }
        },
        update: function() {
            if (!ig.global.wm) {
                this.updateMouseOver();
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                this.currentAnim.alpha = !b.historying && "fullyUp" == b.optionsMenu.state && !b.thinking && 0 == b.historyQueue.length ?
                    1 - this.mouseAlpha : 0.5;
                this.parent()
            }
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-exit").requires("impact.entity").defines(function() {
    EntityButtonExit = ig.Entity.extend({
        zIndex: 2050,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/exit.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        clicked: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            ig.game.player != b.gameEnd &&
                b.resetWinStreak();
            ig.soundHandler.sfxPlayer.play("click");
            ig.game.director.jumpTo(LevelHome)
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.currentAnim.alpha = this.touches(b) ? 0.925 : 1)
            }
        },
        update: function() {
            ig.global.wm || (this.updateMouseOver(), this.parent())
        },
        check: function() {},
        drawVisibleBox: function() {
            if ("teal" == ig.game.getSetting("casualCheckersTheme", "wood")) {
                var b = ig.system.context;
                b.save();
                b.beginPath();
                b.fillStyle = "rgba(0,0,0,0.4)";
                b.rect(this.pos.x -
                    1.2 * this.size.x + this.size.x, this.pos.y - 1.2 * this.size.y + this.size.y, 1.4 * this.size.x, 1.4 * this.size.y);
                b.fill();
                b.restore()
            }
        },
        draw: function() {
            this.drawVisibleBox();
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.toggle-sound").requires("impact.entity").defines(function() {
    EntityToggleSound = ig.Entity.extend({
        zIndex: 2060,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgSound: new ig.Image("media/graphics/game/sound.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashSound = new ig.AnimationSheet(this.imgSound.path, this.imgSound.width / 2, this.imgSound.height), this.anims.mute = new ig.Animation(this.ashSound, 0.1, [0]),
                this.anims.unmute = new ig.Animation(this.ashSound, 0.1, [1]), this.currentAnim = ig.game.getSetting("casualCheckersAudio", !0) ? this.anims.unmute : this.anims.mute, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        clicked: function() {
            var b = !ig.game.getSetting("casualCheckersAudio", !0);
            ig.game.setSetting("casualCheckersAudio", b);
            b ? (this.currentAnim = this.anims.unmute, ig.soundHandler.unmuteSFX(!0), ig.soundHandler.unmuteBGM(!0)) : (this.currentAnim = this.anims.mute, ig.soundHandler.muteSFX(!0), ig.soundHandler.muteBGM(!0));
            ig.soundHandler.sfxPlayer.play("click")
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.currentAnim.alpha = this.touches(b) ? 0.925 : 1)
            }
        },
        update: function() {
            ig.global.wm ||
                (this.updateMouseOver(), this.parent())
        },
        check: function() {},
        drawVisibleBox: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
            "teal" == ig.game.getSetting("casualCheckersTheme", "wood") && b && (b = ig.system.context, b.save(), b.beginPath(), b.fillStyle = "rgba(0,0,0,0.4)", b.rect(this.pos.x - 1.2 * this.size.x + this.size.x, this.pos.y - 1.2 * this.size.y + this.size.y, 1.4 * this.size.x, 1.4 * this.size.y), b.fill(), b.restore())
        },
        draw: function() {
            this.drawVisibleBox();
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.toast").requires("impact.entity").defines(function() {
    EntityToast = ig.Entity.extend({
        zIndex: 4E3,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        init: function(b, c, d) {
            if (!ig.global.wm) switch (this.parent(b, c, d), this.toastAlpha = 1, this.fadeRate = 0.75, this.msg = d.msg, b = ig.game.getSetting("casualCheckersTheme", "wood"), this.colorCode = "255,255,255", b) {
                case "wood":
                    this.colorCode = "255,255,255";
                    break;
                case "teal":
                    this.colorCode = "199, 18, 12";
                    break;
                case "olive":
                    this.colorCode = "255,255,255"
            }
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || (this.toastAlpha = (this.toastAlpha - this.fadeRate * ig.system.tick).min(0), 0 >= this.toastAlpha && this.kill(), this.parent())
        },
        check: function() {},
        drawMsg: function() {
            var b = ig.system.context;
            b.save();
            b.font =
                ig.ua.mobile ? "10pt hammer" : "12pt hammer";
            b.fillStyle = "rgba(" + this.colorCode + "," + this.toastAlpha + ")";
            b.textAlign = "center";
            b.fillText(this.msg, this.pos.x, this.pos.y);
            b.restore()
        },
        draw: function() {
            this.drawMsg();
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.options-menu").requires("impact.entity").defines(function() {
    EntityOptionsMenu = ig.Entity.extend({
        zIndex: 2E3,
        type: ig.Entity.TYPE.A,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/bg_plain_landscape.png"),
        imgFrame: new ig.Image("media/graphics/game/frame.png"),
        imgTitle: new ig.Image("media/graphics/game/options_title.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.inGame = d.inGame, this.oriPos.x = b, this.oriPos.y = c, this.ashDefault =
                new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.state = ig.game.optionDebug ? "fullyDown" : "fullyUp", ig.ua.mobile && this.toPortraitMode(), this.dirty = !1, this.spawnOptionEntities())
        },
        spawnOptionEntities: function() {
            this.colorSelectorRed = ig.game.spawnEntity(EntityColorSelector, 800, 800, {
                master: this,
                color: "red"
            });
            this.colorSelectorBlack = ig.game.spawnEntity(EntityColorSelector, 800, 800, {
                master: this,
                color: "black"
            });
            this.diffSelectorEasy = ig.game.spawnEntity(EntityDifficultySelector, 800, 800, {
                master: this,
                difficulty: "easy"
            });
            this.diffSelectorNormal = ig.game.spawnEntity(EntityDifficultySelector, 800, 800, {
                master: this,
                difficulty: "normal"
            });
            this.diffSelectorHard = ig.game.spawnEntity(EntityDifficultySelector, 800, 800, {
                master: this,
                difficulty: "hard"
            });
            this.forceJumpCheckbox = ig.game.spawnEntity(EntityForceJumpCheckbox,
                800, 800, {
                    master: this
                });
            this.firstMoveSelectorRed = ig.game.spawnEntity(EntityFirstMoveSelector, 800, 800, {
                master: this,
                color: "red"
            });
            this.firstMoveSelectorBlack = ig.game.spawnEntity(EntityFirstMoveSelector, 800, 800, {
                master: this,
                color: "black"
            });
            this.firstMoveSelectorRandom = ig.game.spawnEntity(EntityFirstMoveSelector, 800, 800, {
                master: this,
                color: "random"
            });
            this.themeSelectorWood = ig.game.spawnEntity(EntityThemeSelector, 800, 800, {
                master: this,
                theme: "wood"
            });
            this.themeSelectorTeal = ig.game.spawnEntity(EntityThemeSelector,
                800, 800, {
                    master: this,
                    theme: "teal"
                });
            this.themeSelectorOlive = ig.game.spawnEntity(EntityThemeSelector, 800, 800, {
                master: this,
                theme: "olive"
            });
            this.inGame && (this.newGame = ig.game.spawnEntity(EntityButtonNewGame, 800, 800, {
                eType: "option",
                master: this
            }));
            this.ok = ig.game.spawnEntity(EntityButtonOk, 800, 800, {
                master: this
            })
        },
        toPortraitMode: function() {
            this.offset.x = (this.imgDefault.width - this.imgDefault.height) / 2;
            this.offset.y = (this.imgDefault.height - this.imgDefault.width) / 2;
            this.currentAnim.angle = (90).toRad()
        },
        pullDownMenu: function() {
            if ("fullyUp" ==
                this.state) {
                if (!this.inGame) {
                    var b = ig.game.getEntitiesByType(EntityButtonMoreGames)[0];
                    b && b.hide()
                }
                this.state = "pullingDown";
                this.tweener = this.tween({
                    pos: {
                        y: 0
                    }
                }, 0.65, {
                    easing: ig.Tween.Easing.Bounce.EaseOut
                });
                this.tweener.start()
            }
        },
        pullUpMenu: function() {
            if ("fullyDown" == this.state) {
                if (!this.inGame) {
                    var b = ig.game.getEntitiesByType(EntityButtonMoreGames)[0];
                    b && b.show()
                }
                this.state = "pullingUp";
                this.tweener = this.tween({
                    pos: {
                        y: -ig.system.height
                    }
                }, 0.5, {
                    easing: ig.Tween.Easing.Exponential.EaseIn
                });
                this.tweener.start()
            }
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || ("pullingDown" == this.state && this.tweener && this.tweener.complete ? this.state = "fullyDown" : "pullingUp" == this.state && this.tweener && this.tweener.complete && (this.state = "fullyUp"), this.parent())
        },
        check: function() {},
        drawTitle: function() {
            this.imgTitle.draw(this.pos.x + (ig.system.width / 2 - this.imgTitle.width / 2), this.pos.y + 0.025 * ig.system.height)
        },
        drawFrame: function() {
            this.imgFrame.draw(this.pos.x + (ig.system.width / 2 - this.imgFrame.width / 2), this.pos.y + (ig.system.height / 2 - this.imgFrame.height / 2))
        },
        drawLabels: function() {
            var b = this.colorSelectorBlack,
                c = this.firstMoveSelectorBlack,
                d = this.themeSelectorWood,
                e = ig.system.context;
            e.save();
            ig.ua.mobile ? (e.font = "15pt hammer", e.fillStyle = "rgba(255,255,255,1)", e.textAlign = "left",
                e.fillText(_STRINGS.Game.Color, 0.325 * ig.system.width, b.pos.y + 0.75 * b.size.y), e.fillText(_STRINGS.Game.FirstMove, 0.235 * ig.system.width, c.pos.y + 0.75 * c.size.y), e.fillText(_STRINGS.Game.Theme, 0.085 * ig.system.width, d.pos.y + 0.55 * d.size.y), e.font = "9pt hammer", e.textAlign = "left", this.inGame ? (e.fillText(_STRINGS.Game.ResetGame, 0.065 * ig.system.width, this.pos.y + 0.78 * ig.system.height), e.fillText(_STRINGS.Game.ResetGame2, 0.065 * ig.system.width, this.pos.y + 0.805 * ig.system.height)) : e.fillText(_STRINGS.Game.ResetGame2,
                    0.065 * ig.system.width, this.pos.y + 0.78 * ig.system.height)) : (e.font = "15pt hammer", e.fillStyle = "rgba(255,255,255,1)", e.textAlign = "left", e.fillText(_STRINGS.Game.Color, 0.365 * ig.system.width, b.pos.y + 0.75 * b.size.y), e.fillText(_STRINGS.Game.FirstMove, 0.295 * ig.system.width, c.pos.y + 0.75 * c.size.y), e.fillText(_STRINGS.Game.Theme, 0.195 * ig.system.width, d.pos.y + 0.55 * d.size.y), e.font = "9pt hammer", e.textAlign = "left", this.inGame && e.fillText(_STRINGS.Game.ResetGame, 0.175 * ig.system.width, this.pos.y + 0.79 * ig.system.height),
                e.fillText(_STRINGS.Game.ResetGame2, 0.175 * ig.system.width, this.pos.y + 0.825 * ig.system.height));
            e.restore()
        },
        drawWinStreakRecord: function() {
            var b = this.inGame ? ig.game.getEntitiesByType(EntityGameplayControl)[0].winStreak.bw.min(0) : ig.game.getWinStreakRecord().bw.min(0),
                c = ig.system.context;
            c.save();
            c.fillStyle = "rgba(255,255,255,1)";
            ig.ua.mobile ? (c.textAlign = "center", c.font = "11pt hammer", c.fillText(_STRINGS.Game.BestWinStreak + b, 0.5 * ig.system.width, this.pos.y + 0.865 * ig.system.height)) : (c.textAlign = "right",
                c.font = "10pt hammer", c.fillText(_STRINGS.Game.BestWinStreak + b, 0.9825 * ig.system.width, this.pos.y + 0.955 * ig.system.height));
            c.restore()
        },
        draw: function() {
            this.parent();
            this.drawTitle();
            this.drawFrame();
            this.drawLabels();
            this.drawWinStreakRecord()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-ok").requires("impact.entity").defines(function() {
    EntityButtonOk = ig.Entity.extend({
        zIndex: 2070,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/button_ok.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.master = d.master, this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        followMaster: function() {
            this.pos.x = this.master.inGame ? this.master.pos.x + (0.52 * ig.system.width + 0 * this.imgDefault.width) :
                this.master.pos.x + (0.5 * ig.system.width - 0.5 * this.imgDefault.width);
            this.pos.y = ig.ua.mobile ? this.master.pos.y + 0.89 * ig.system.height : this.master.pos.y + 0.875 * ig.system.height
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            this.master.pullUpMenu()
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.currentAnim.alpha = this.touches(b) ? 0.925 : 1)
            }
        },
        update: function() {
            ig.global.wm || (this.followMaster(), this.updateMouseOver(), this.parent())
        },
        check: function() {},
        drawDirtyIndicator: function() {
            if (this.master.dirty && this.master.inGame) {
                var b = ig.system.context;
                b.save();
                b.font = "15pt hammer";
                b.fillStyle = "rgba(255,255,255,1)";
                b.textAlign = "center";
                b.fillText("*", this.pos.x + 0.9 * this.size.x, this.pos.y + 0.475 * this.size.y);
                b.restore()
            }
        },
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.color-selector").requires("impact.entity").defines(function() {
    EntityColorSelector = ig.Entity.extend({
        zIndex: 2080,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgRed: new ig.Image("media/graphics/game/small_checker_red.png"),
        imgBlack: new ig.Image("media/graphics/game/small_checker_black.png"),
        imgSel: new ig.Image("media/graphics/game/small_checker_selection.png"),
        init: function(b, c, d) {
            if (!ig.global.wm) {
                this.parent(b, c, d);
                this.master = d.master;
                this.color =
                    d.color;
                switch (this.color) {
                    case "red":
                        this.imgDefault = this.imgRed;
                        break;
                    case "black":
                        this.imgDefault = this.imgBlack
                }
                this.oriPos.x = b;
                this.oriPos.y = c;
                this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height);
                this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]);
                this.currentAnim = this.anims.default;
                this.size.x = this.currentAnim.sheet.width;
                this.size.y = this.currentAnim.sheet.height
            }
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width *
                this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        followMaster: function() {
            if (ig.ua.mobile) {
                switch (this.color) {
                    case "black":
                        this.pos.x = this.master.pos.x + (0.5 * ig.system.width - this.imgDefault.width / 2);
                        break;
                    case "red":
                        this.pos.x = this.master.pos.x + (0.595 * ig.system.width - this.imgDefault.width / 2)
                }
                this.pos.y = this.master.pos.y + 0.2825 * ig.system.height
            } else {
                switch (this.color) {
                    case "black":
                        this.pos.x =
                            this.master.pos.x + (0.5 * ig.system.width - this.imgDefault.width / 2);
                        break;
                    case "red":
                        this.pos.x = this.master.pos.x + (0.565 * ig.system.width - this.imgDefault.width / 2)
                }
                this.pos.y = this.master.pos.y + 0.2 * ig.system.height
            }
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            ig.game.getSetting("casualCheckersColor", "black") != this.color && (ig.game.setSetting("casualCheckersColor", this.color), this.master.dirty = !0)
        },
        update: function() {
            ig.global.wm || (this.followMaster(), this.parent())
        },
        check: function() {},
        drawSelection: function() {
            ig.game.getSetting("casualCheckersColor",
                "black") == this.color && this.imgSel.draw(this.pos.x - (this.imgSel.width - this.imgDefault.width) / 2, this.pos.y - (this.imgSel.height - this.imgDefault.height) / 2)
        },
        draw: function() {
            this.drawSelection();
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.difficulty-selector").requires("impact.entity").defines(function() {
    EntityDifficultySelector = ig.Entity.extend({
        zIndex: 2070,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/check_radio_box.png"),
        imgSel: new ig.Image("media/graphics/game/checkmark.png"),
        init: function(b, c, d) {
            if (!ig.global.wm) {
                this.parent(b, c, d);
                this.master = d.master;
                this.difficulty = d.difficulty;
                this.oriPos.x = b;
                this.oriPos.y = c;
                this.ashDefault = new ig.AnimationSheet(this.imgDefault.path,
                    this.imgDefault.width, this.imgDefault.height);
                this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]);
                this.currentAnim = this.anims.default;
                this.size.x = this.currentAnim.sheet.width;
                this.size.y = this.currentAnim.sheet.height;
                this.label = "";
                switch (this.difficulty) {
                    case "easy":
                        this.label = _STRINGS.Game.Easy;
                        break;
                    case "normal":
                        this.label = _STRINGS.Game.Normal;
                        break;
                    case "hard":
                        this.label = _STRINGS.Game.Hard
                }
                b = 1.125 * this.getLabelWidth(this.label);
                this.size.x += b
            }
        },
        getLabelWidth: function(b) {
            var c = ig.system.context;
            c.save();
            c.font = "15pt hammer";
            b = c.measureText(b).width;
            c.restore();
            return b
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        followMaster: function() {
            if (ig.ua.mobile) {
                switch (this.difficulty) {
                    case "easy":
                        this.pos.x = this.master.pos.x + (0.305 * ig.system.width - this.size.x / 2);
                        break;
                    case "normal":
                        this.pos.x = this.master.pos.x + (0.5 * ig.system.width - this.size.x / 2);
                        break;
                    case "hard":
                        this.pos.x = this.master.pos.x + (0.695 * ig.system.width - this.size.x / 2)
                }
                this.pos.y = this.master.pos.y + 0.3625 * ig.system.height
            } else {
                switch (this.difficulty) {
                    case "easy":
                        this.pos.x = this.master.pos.x + (0.35 * ig.system.width - this.size.x / 2);
                        break;
                    case "normal":
                        this.pos.x = this.master.pos.x + (0.5 * ig.system.width - this.size.x / 2);
                        break;
                    case "hard":
                        this.pos.x = this.master.pos.x + (0.64 * ig.system.width - this.size.x / 2)
                }
                this.pos.y =
                    this.master.pos.y + 0.315 * ig.system.height
            }
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            ig.game.getSetting("casualCheckersDifficulty", "easy") != this.difficulty && (ig.game.setSetting("casualCheckersDifficulty", this.difficulty), this.master.dirty = !0)
        },
        update: function() {
            ig.global.wm || (this.followMaster(), this.parent())
        },
        check: function() {},
        drawLabel: function() {
            var b = ig.system.context;
            b.save();
            b.font = "15pt hammer";
            b.fillStyle = "rgba(255,255,255,1)";
            b.textAlign = "left";
            b.fillText(this.label, this.pos.x +
                1.1 * this.imgDefault.width, this.pos.y + 0.8 * this.imgDefault.height);
            b.restore()
        },
        drawSelection: function() {
            ig.game.getSetting("casualCheckersDifficulty", "easy") == this.difficulty && this.imgSel.draw(this.pos.x, this.pos.y + -(0.125 * this.imgDefault.height))
        },
        draw: function() {
            this.parent();
            this.drawLabel();
            this.drawSelection()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.force-jump-checkbox").requires("impact.entity").defines(function() {
    EntityForceJumpCheckbox = ig.Entity.extend({
        zIndex: 2090,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/check_radio_box.png"),
        imgSel: new ig.Image("media/graphics/game/checkmark.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.master = d.master, this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path,
                this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.label = _STRINGS.Game.ForceJump, b = 1.05 * this.getLabelWidth(this.label), this.size.x += b)
        },
        getLabelWidth: function(b) {
            var c = ig.system.context;
            c.save();
            c.font = "15pt hammer";
            b = c.measureText(b).width;
            c.restore();
            return b
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width *
                this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        followMaster: function() {
            ig.ua.mobile ? (this.pos.x = this.master.diffSelectorEasy.pos.x, this.pos.y = this.master.pos.y + 0.4375 * ig.system.height) : (this.pos.x = this.master.diffSelectorEasy.pos.x, this.pos.y = this.master.pos.y + 0.415 * ig.system.height)
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            var b = ig.game.getSetting("casualCheckersForceJumps", !0);
            ig.game.setSetting("casualCheckersForceJumps", !b);
            this.master.dirty = !0
        },
        update: function() {
            ig.global.wm || (this.followMaster(), this.parent())
        },
        check: function() {},
        drawLabel: function() {
            var b = ig.system.context;
            b.save();
            b.font = "15pt hammer";
            b.fillStyle = "rgba(255,255,255,1)";
            b.textAlign = "left";
            b.fillText(this.label, this.pos.x + 1.1 * this.imgDefault.width, this.pos.y + 0.8 * this.imgDefault.height);
            b.restore()
        },
        drawSelection: function() {
            ig.game.getSetting("casualCheckersForceJumps", !0) && this.imgSel.draw(this.pos.x, this.pos.y + -(0.125 * this.imgDefault.height))
        },
        draw: function() {
            this.parent();
            this.drawLabel();
            this.drawSelection()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.first-move-selector").requires("impact.entity").defines(function() {
    EntityFirstMoveSelector = ig.Entity.extend({
        zIndex: 2080,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgRed: new ig.Image("media/graphics/game/small_checker_red.png"),
        imgBlack: new ig.Image("media/graphics/game/small_checker_black.png"),
        imgRandom: new ig.Image("media/graphics/game/small_checker_random.png"),
        imgSel: new ig.Image("media/graphics/game/small_checker_selection.png"),
        init: function(b,
            c, d) {
            if (!ig.global.wm) {
                this.parent(b, c, d);
                this.master = d.master;
                this.color = d.color;
                switch (this.color) {
                    case "red":
                        this.imgDefault = this.imgRed;
                        break;
                    case "black":
                        this.imgDefault = this.imgBlack;
                        break;
                    case "random":
                        this.imgDefault = this.imgRandom
                }
                this.oriPos.x = b;
                this.oriPos.y = c;
                this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height);
                this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]);
                this.currentAnim = this.anims.default;
                this.size.x = this.currentAnim.sheet.width;
                this.size.y = this.currentAnim.sheet.height
            }
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        followMaster: function() {
            if (ig.ua.mobile) switch (this.color) {
                case "black":
                    this.pos.x = this.master.pos.x + (0.5 * ig.system.width - this.imgDefault.width / 2);
                    break;
                case "red":
                    this.pos.x = this.master.pos.x +
                        (0.595 * ig.system.width - this.imgDefault.width / 2);
                    break;
                case "random":
                    this.pos.x = this.master.pos.x + (0.69 * ig.system.width - this.imgDefault.width / 2)
            } else switch (this.color) {
                case "black":
                    this.pos.x = this.master.pos.x + (0.5 * ig.system.width - this.imgDefault.width / 2);
                    break;
                case "red":
                    this.pos.x = this.master.pos.x + (0.565 * ig.system.width - this.imgDefault.width / 2);
                    break;
                case "random":
                    this.pos.x = this.master.pos.x + (0.63 * ig.system.width - this.imgDefault.width / 2)
            }
            this.pos.y = this.master.pos.y + 0.505 * ig.system.height
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            ig.game.getSetting("casualCheckersFirstMove", "black") != this.color && (ig.game.setSetting("casualCheckersFirstMove", this.color), this.master.dirty = !0)
        },
        update: function() {
            ig.global.wm || (this.followMaster(), this.parent())
        },
        check: function() {},
        drawSelection: function() {
            ig.game.getSetting("casualCheckersFirstMove", "black") == this.color && this.imgSel.draw(this.pos.x - (this.imgSel.width - this.imgDefault.width) / 2, this.pos.y - (this.imgSel.height - this.imgDefault.height) / 2)
        },
        draw: function() {
            this.drawSelection();
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.theme-selector").requires("impact.entity").defines(function() {
    EntityThemeSelector = ig.Entity.extend({
        zIndex: 2110,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgWood: new ig.Image("media/graphics/game/pattern_wood.png"),
        imgTeal: new ig.Image("media/graphics/game/pattern_teal.png"),
        imgOlive: new ig.Image("media/graphics/game/pattern_olive.png"),
        imgSel: new ig.Image("media/graphics/game/pattern_selection.png"),
        init: function(b, c, d) {
            if (!ig.global.wm) {
                this.parent(b, c,
                    d);
                this.master = d.master;
                this.theme = d.theme;
                switch (this.theme) {
                    case "wood":
                        this.imgDefault = this.imgWood;
                        break;
                    case "teal":
                        this.imgDefault = this.imgTeal;
                        break;
                    case "olive":
                        this.imgDefault = this.imgOlive
                }
                this.oriPos.x = b;
                this.oriPos.y = c;
                this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height);
                this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]);
                this.currentAnim = this.anims.default;
                this.size.x = this.currentAnim.sheet.width;
                this.size.y = this.currentAnim.sheet.height
            }
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        followMaster: function() {
            if (ig.ua.mobile) {
                switch (this.theme) {
                    case "wood":
                        this.pos.x = this.master.pos.x + (0.325 * ig.system.width - this.imgDefault.width / 2);
                        break;
                    case "teal":
                        this.pos.x = this.master.pos.x + (0.5 * ig.system.width - this.imgDefault.width /
                            2);
                        break;
                    case "olive":
                        this.pos.x = this.master.pos.x + (0.675 * ig.system.width - this.imgDefault.width / 2)
                }
                this.pos.y = this.master.pos.y + 0.595 * ig.system.height
            } else {
                switch (this.theme) {
                    case "wood":
                        this.pos.x = this.master.pos.x + (0.375 * ig.system.width - this.imgDefault.width / 2);
                        break;
                    case "teal":
                        this.pos.x = this.master.pos.x + (0.5 * ig.system.width - this.imgDefault.width / 2);
                        break;
                    case "olive":
                        this.pos.x = this.master.pos.x + (0.625 * ig.system.width - this.imgDefault.width / 2)
                }
                this.pos.y = this.master.pos.y + 0.625 * ig.system.height
            }
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            ig.game.setSetting("casualCheckersTheme", this.theme);
            if (this.master.inGame) {
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                b.board.getSelectedPattern();
                b.bg.getSelectedPattern();
                for (var b = ig.game.getEntitiesByType(EntityClickArea), c = 0; c < b.length; c++) b[c].updateColor()
            }
        },
        update: function() {
            ig.global.wm || (this.followMaster(), this.parent())
        },
        check: function() {},
        drawSelection: function() {
            ig.game.getSetting("casualCheckersTheme", "wood") ==
                this.theme && this.imgSel.draw(this.pos.x - (0.55 * (this.imgSel.width - this.imgDefault.width)).ceil(), this.pos.y - (this.imgSel.height - this.imgDefault.height) / 2)
        },
        draw: function() {
            this.drawSelection();
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.announce").requires("impact.entity").defines(function() {
    EntityAnnounce = ig.Entity.extend({
        zIndex: 1500,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/frame_announcement.png"),
        imgShine: new ig.Image("media/graphics/game/shine.png"),
        imgmanBlack: new ig.Image("media/graphics/game/checker_man_black.png"),
        imgmanRed: new ig.Image("media/graphics/game/checker_man_red.png"),
        imgSparkle: new ig.Image("media/graphics/game/sparkle.png"),
        init: function(b, c, d) {
            if (!ig.global.wm) {
                this.parent(b, c, d);
                this.aType = d.aType;
                this.oriPos.x = b;
                this.oriPos.y = c;
                this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height);
                this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]);
                this.currentAnim = this.anims.default;
                this.size.x = ig.system.width;
                this.size.y = ig.system.height;
                this.offset.x = -(0.5 * ig.system.width - 0.5 * this.imgDefault.width);
                this.offset.y = -(0.5 * ig.system.height - 0.5 * this.imgDefault.height);
                switch (this.aType) {
                    case "end":
                        this.buttonNewGame =
                            ig.game.spawnEntity(EntityButtonNewGame, 0.5 * ig.system.width - 64.5, 0.55 * ig.system.height, {
                                eType: "end"
                            }), b = ig.game.getEntitiesByType(EntityGameplayControl)[0], c = b.sessionCasualCheckersDifficulty, ig.game.player == b.gameEnd ? (c != b.winStreak.d && b.resetWinStreak(), b.incrementWinStreak()) : b.resetWinStreak()
                }
                this.sparkleSC = 1;
                this.shineSC = 0.1;
                this.shineDegree = 0;
                this.tweenSparkle();
                this.tweenShineSC();
                this.tweenShineRot();
                this.pieceSC = 0.15;
                this.tweenPieceSC();
                b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                switch (b.gameEnd) {
                    case 2:
                    case 3:
                        ig.game.player == b.gameEnd ? ig.soundHandler.sfxPlayer.play("win") : ig.soundHandler.sfxPlayer.play("lose")
                }
            }
        },
        tweenShineRot: function() {
            var b = this.tween({
                shineDegree: 360
            }, 4.25, {
                easing: ig.Tween.Easing.Linear.EaseNone,
                onComplete: function() {
                    this.shineDegree = 0
                }.bind(this)
            });
            b.chain(b);
            b.start()
        },
        tweenPieceSC: function() {
            this.tween({
                pieceSC: 1.35
            }, 1, {
                easing: ig.Tween.Easing.Exponential.EaseInOut
            }).start()
        },
        tweenShineSC: function() {
            var b = this.tween({
                    shineSC: 1.1
                }, 0.4, {
                    easing: ig.Tween.Easing.Linear.EaseNone
                }),
                c = this.tween({
                    shineSC: 0.75
                }, 1.25, {
                    easing: ig.Tween.Easing.Linear.EaseNone
                });
            b.chain(c);
            c.chain(b);
            b.start()
        },
        tweenSparkle: function() {
            var b = this.tween({
                    sparkleSC: 0.25
                }, 1.5, {
                    easing: ig.Tween.Easing.Linear.EaseNone
                }),
                c = this.tween({
                    sparkleSC: 1
                }, 1.5, {
                    easing: ig.Tween.Easing.Linear.EaseNone
                });
            b.chain(c);
            c.chain(b);
            b.start()
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x =
                this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            if (!ig.global.wm) {
                var b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                if (ig.game.player == b.gameEnd && 0 < b.winStreak.w) {
                    var c = ig.game.getEntitiesByType(EntityToast);
                    0 >= c.length ? b.orderToast(_STRINGS.Game.CloseGameWin) : c[0].msg == _STRINGS.Game.CloseGameWin && (c[0].toastAlpha = 1)
                }
                this.parent()
            }
        },
        check: function() {},
        drawShade: function() {
            var b = ig.system.context;
            b.save();
            b.beginPath();
            b.fillStyle = "rgba(0,0,0,0.25)";
            b.rect(0 * ig.system.width, 0 * ig.system.height, ig.system.width, ig.system.height);
            b.fill();
            b.restore()
        },
        drawImg: function(b, c, d, e) {
            var f = ig.system.context;
            f.save();
            f.drawImage(b.data, c, d, b.width * e, b.height * e);
            f.restore()
        },
        drawImgRot: function(b, c, d, e, f) {
            var j = ig.system.context;
            j.save();
            j.translate(c + b.width * e / 2, d + b.height * e / 2);
            j.rotate(f % 360 * Math.PI / 180);
            j.translate(-(c + b.width * e / 2), -(d + b.height * e / 2));
            j.drawImage(b.data, c, d, b.width * e, b.height * e);
            j.restore()
        },
        drawGameEndAnnouncement: function() {
            var b = ig.game.getEntitiesByType(EntityGameplayControl)[0],
                c = "";
            switch (b.gameEnd) {
                case 0:
                    c = _STRINGS.Game.Draw;
                    break;
                case 2:
                case 3:
                    ig.game.player == b.gameEnd && this.drawImgRot(this.imgShine, 0.5 * ig.system.width - 0.5 * this.imgShine.width * this.shineSC, Math.abs(this.offset.y) - 0.5 * this.imgShine.height * this.shineSC, this.shineSC, this.shineDegree), ig.game.player == b.gameEnd ? (b = this["img" + ig.game.playerColor], this.drawImg(b, 0.5 * ig.system.width - 0.5 * b.width * this.pieceSC, Math.abs(this.offset.y) - 0.5 * b.height * this.pieceSC, this.pieceSC), c = _STRINGS.Game.Win) : (b = this["img" + ig.game.opponentColor],
                        this.drawImg(b, 0.5 * ig.system.width - 0.5 * b.width * this.pieceSC, Math.abs(this.offset.y) - 0.5 * b.height * this.pieceSC, this.pieceSC), c = _STRINGS.Game.Lose), this.drawImg(this.imgSparkle, 0.5 * ig.system.width + 0.225 * b.width * this.pieceSC - 0.5 * this.imgSparkle.width * this.sparkleSC, Math.abs(this.offset.y) - 0.425 * b.height * this.pieceSC - 0.5 * this.imgSparkle.height * this.sparkleSC, this.sparkleSC)
            }
            b = ig.system.context;
            b.save();
            b.font = "35pt hammer";
            b.fillStyle = "rgba(255,255,255,1)";
            b.textAlign = "center";
            b.fillText(c, 0.5 * ig.system.width,
                0.475 * ig.system.height);
            b.restore()
        },
        draw: function() {
            this.drawShade();
            this.parent();
            switch (this.aType) {
                case "end":
                    this.drawGameEndAnnouncement()
            }
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-new-game").requires("impact.entity").defines(function() {
    EntityButtonNewGame = ig.Entity.extend({
        zIndex: 2120,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/button_new_game.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.eType = d.eType, this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default =
                new ig.Animation(this.ashDefault, 0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height)
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            var b =
                ig.game.getEntitiesByType(EntityGameplayControl)[0];
            b.newGame();
            switch (this.eType) {
                case "option":
                    b = ig.game.getEntitiesByType(EntityGameplayControl)[0];
                    b.newGame();
                    ig.game.sortEntitiesDeferred();
                    this.master.pullUpMenu();
                    b.resetWinStreak();
                    break;
                case "end":
                    (b = ig.game.getEntitiesByType(EntityAnnounce)[0]) && b.kill(), this.kill(), ig.game.sortEntitiesDeferred()
            }
        },
        followMaster: function() {
            this.pos.x = this.master.pos.x + (0.48 * ig.system.width - this.imgDefault.width);
            this.pos.y = ig.ua.mobile ? this.master.pos.y + 0.89 *
                ig.system.height : this.master.pos.y + 0.875 * ig.system.height
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.currentAnim.alpha = this.touches(b) ? 0.925 : 1)
            }
        },
        update: function() {
            ig.global.wm || ("option" == this.eType && this.followMaster(), this.updateMouseOver(), this.parent())
        },
        check: function() {},
        drawDirtyIndicator: function() {
            var b = ig.system.context;
            b.save();
            b.font = "15pt hammer";
            b.fillStyle = "rgba(255,255,255,1)";
            b.textAlign = "center";
            b.fillText("*", this.pos.x +
                0.9 * this.size.x, this.pos.y + 0.475 * this.size.y);
            b.restore()
        },
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.background-home").requires("impact.entity").defines(function() {
    EntityBackgroundHome = ig.Entity.extend({
        zIndex: 10,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/bg_plain_landscape.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default = new ig.Animation(this.ashDefault,
                0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, ig.ua.mobile && this.toPortraitMode())
        },
        toPortraitMode: function() {
            this.offset.x = (this.imgDefault.width - this.imgDefault.height) / 2;
            this.offset.y = (this.imgDefault.height - this.imgDefault.width) / 2;
            this.currentAnim.angle = (90).toRad()
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y /
                2).floor()
        },
        updatePosScreen: function() {
            this.pos.x = this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-play").requires("impact.entity").defines(function() {
    EntityButtonPlay = ig.Entity.extend({
        zIndex: 30,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/button_play.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.pos.x = -this.imgDefault.width, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height), this.anims.default =
                new ig.Animation(this.ashDefault, 0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.tweenTransition())
        },
        tweenTransition: function() {
            this.tween({
                pos: {
                    x: this.oriPos.x
                }
            }, 0.2, {
                easing: ig.Tween.Easing.Linear.EaseNone
            }).start()
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x =
                this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        clicked: function() {
            ig.soundHandler.sfxPlayer.play("click");
            if ("fullyUp" == ig.game.getEntitiesByType(EntityHomeControl)[0].optionsMenu.state) {
                var b = ig.game.getWinStreakRecord();
                b.u && (b.u = !1, b.w = -1, b.d = ig.game.getSetting("casualCheckersDifficulty", "easy"), ig.game.setSetting("casualCheckersWin", b));
                ig.game.director.jumpTo(LevelGameplay)
            }
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.currentAnim.alpha = this.touches(b) ? 0.925 : 1)
            }
        },
        update: function() {
            ig.global.wm || (this.updateMouseOver(), this.parent())
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.entities.button-options-home").requires("impact.entity").defines(function() {
    EntityButtonOptionsHome = ig.Entity.extend({
        zIndex: 40,
        type: ig.Entity.TYPE.B,
        gravityFactor: 0,
        offset: {
            x: 0,
            y: 0
        },
        oriPos: {
            x: 0,
            y: 0
        },
        imgDefault: new ig.Image("media/graphics/game/button_options.png"),
        init: function(b, c, d) {
            ig.global.wm || (this.parent(b, c, d), this.oriPos.x = b, this.oriPos.y = c, this.pos.x = -this.imgDefault.width, this.ashDefault = new ig.AnimationSheet(this.imgDefault.path, this.imgDefault.width, this.imgDefault.height),
                this.anims.default = new ig.Animation(this.ashDefault, 0.1, [0]), this.currentAnim = this.anims.default, this.size.x = this.currentAnim.sheet.width, this.size.y = this.currentAnim.sheet.height, this.tweenTransition())
        },
        tweenTransition: function() {
            this.tween({
                pos: {
                    x: this.oriPos.x
                }
            }, 0.2, {
                easing: ig.Tween.Easing.Linear.EaseNone
            }).start()
        },
        updateOffset: function() {
            this.offset.x = (this.currentAnim.sheet.width * this.scale.x / 2).floor();
            this.offset.y = (this.currentAnim.sheet.height * this.scale.y / 2).floor()
        },
        updatePosScreen: function() {
            this.pos.x =
                this.oriPos.x + ig.game.screen.x;
            this.pos.y = this.oriPos.y + ig.game.screen.y
        },
        clicked: function() {
            // ig.soundHandler.sfxPlayer.play("click");
            // ig.game.getEntitiesByType(EntityHomeControl)[0].optionsMenu.pullDownMenu()
        },
        updateMouseOver: function() {
            if (!ig.ua.mobile) {
                var b = ig.game.getEntitiesByType(EntityPointer)[0];
                b && (this.currentAnim.alpha = this.touches(b) ? 0.925 : 1)
            }
        },
        update: function() {
            ig.global.wm || (this.updateMouseOver(), this.parent())
        },
        check: function() {},
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.classes.uct-node").requires("impact.impact").defines(function() {
    ClassUctNode = ig.Class.extend({
        init: function(b, c) {
            this.visits = 1;
            this.score = 0;
            this.children = null;
            this.player = c;
            this.move = b
        },
        opponent: function() {
            return this.player ^ 1
        },
        append: function(b) {
            this.children ? this.children.push(b) : this.children = [b]
        },
        playFor: function(b) {
            var c = this.move;
            return b.move(c >> 24, c >> 16 & 255, c >> 8 & 255, c & 255, "ai", 0)
        },
        expand: function(b, c) {
            c.clear();
            b.fillMoveList(c);
            for (var d = 0; d < c.length; d++) {
                var e = new ClassUctNode(c.list[d],
                    b.player);
                this.append(e)
            }
        },
        ucb: function(b) {
            return this.score / this.visits + Math.sqrt(b / this.visits)
        },
        findBestChild: function() {
            for (var b = 20 * Math.log(this.visits), c = -Infinity, d = null, e = 0; e < this.children.length; e++) {
                var f = this.children[e],
                    j = f.ucb(b);
                j > c && (c = j, d = f)
            }
            return d
        }
    })
});
ig.baked = !0;
ig.module("game.classes.uct").requires("impact.impact").defines(function() {
    ClassUct = ig.Class.extend({
        init: function(b, c) {
            var d = 250;
            if (1 == c) d = 1E4;
            else switch (ig.game.getEntitiesByType(EntityGameplayControl)[0].sessionCasualCheckersDifficulty) {
                case "easy":
                    d = 25;
                    break;
                case "normal":
                    d = 125;
                    break;
                case "hard":
                    d = 4E3
            }
            this.runMax = d;
            this.root = new ClassUctNode(0, 0);
            this.MaturityThreshold = 200;
            this.ori = b;
            this.moveList = new ClassMoveList(this.ori.area());
            this.MaxHistory = this.ori.area();
            this.root.expand(this.ori, this.moveList);
            this.history = [this.root];
            this.TotalPlayouts = 0;
            d = Date.now();
            for (this.elapsed; !(this.run(), this.TotalPlayouts++, this.elapsed = Date.now() - d, this.TotalPlayouts >= this.runMax || this.elapsed >= ig.game.aiMaxThinkTime););
            for (var d = null, e = -Infinity, f = 0; f < this.root.children.length; f++) {
                var j = this.root.children[f];
                j.visits > e && (d = j, e = j.visits)
            }
            d = d.move;
            this.fromRow = d >> 24;
            this.fromCol = d >> 16 & 255;
            this.toRow = d >> 8 & 255;
            this.toCol = d & 255
        },
        getVal: function() {
            return {
                elapsed: this.elapsed,
                playouts: this.TotalPlayouts,
                fromRow: this.fromRow,
                fromCol: this.fromCol,
                toRow: this.toRow,
                toCol: this.toCol
            }
        },
        playout: function(b) {
            for (var c = 0; 60 > ++c;) {
                var d = b.moveRandom(this.moveList);
                if (d) return d
            }
            c = b.evaluateScore(ig.game.PlayerOne);
            b = b.evaluateScore(ig.game.PlayerTwo);
            return c > b ? ig.game.PlayerOne : c < b ? ig.game.PlayerTwo : 0
        },
        run: function() {
            for (var b = 1, c = this.ori.copy(), d = this.root, e = 0;;) {
                if (null === d.children) {
                    if (d.visits >= this.MaturityThreshold) {
                        d.expand(c, this.moveList);
                        if (null === d.children) {
                            e = d.opponent();
                            this.history[b++] = d;
                            break
                        }
                        continue
                    }
                    e = this.playout(c);
                    break
                }
                d = d.findBestChild();
                this.history[b++] = d;
                if (d.playFor(c)) {
                    e = c.player;
                    break
                }
            }
            for (c = 0; c < b; c++) d = this.history[c], d.visits++, e == d.player ? d.score += 1 : 0 != e && (d.score -= 1)
        }
    })
});
ig.baked = !0;
ig.module("game.classes.move-list").requires("impact.impact").defines(function() {
    ClassMoveList = ig.Class.extend({
        init: function(b) {
            this.list = Array(b);
            this.length = 0
        },
        add: function(b, c, d, e) {
            this.list[this.length++] = b << 24 | c << 16 | d << 8 | e
        },
        clear: function() {
            this.length = 0
        }
    })
});
ig.baked = !0;
ig.module("game.classes.board").requires("impact.impact").defines(function() {
    ClassBoard = ig.Class.extend({
        init: function() {
            this.rows = ig.game.rows;
            this.cols = ig.game.cols;
            this.pieceCount = [0, 0, ig.game.PiecesPerPlayer, ig.game.PiecesPerPlayer];
            this.grid = Array(ig.game.BoardArea + 2 * ig.game.PiecesPerPlayer);
            this.clear();
            for (var b = 1, c = 0, d = 0; d < ig.game.RowsPerPlayer; d++) {
                for (var e = b; e < this.cols; e += 2) this.initPiece(d, e, c, ig.game.PlayerOne), c++;
                b ^= 1
            }
            b = 0;
            for (d = ig.game.RowsPerPlayer + 2; d < this.rows; d++) {
                for (e = b; e < this.cols; e +=
                    2) this.initPiece(d, e, c, ig.game.PlayerTwo), c++;
                b ^= 1
            }
        },
        initPiece: function(b, c, d, e) {
            this.grid[b * this.cols + c] = d << 8 | e;
            this.grid[ig.game.BoardArea + d] = b << 8 | c
        },
        removePiece: function(b, c, d, e) {
            var f = b * this.cols + c,
                j = this.grid[f];
            this.grid[f] = 0;
            f = j & 3;
            this.grid[ig.game.BoardArea + (j >> 8 & 255)] = -1;
            if ("entity" == d) {
                d = ig.game.getEntitiesByType(EntityChecker);
                for (var t = 0; t < d.length; t++) d[t].row == b && d[t].col == c && d[t].captured(e)
            }
            j & 4 && this.pieceCount[f & 1]--;
            return --this.pieceCount[f]
        },
        getPiece: function(b, c) {
            return this.grid[(b <<
                3) + c]
        },
        getPlayer: function(b, c) {
            return this.getPiece(b, c) & 3
        },
        clear: function() {
            this.player = ig.game.PlayerOne;
            this.multiTurn = !1;
            for (var b = 0; b < ig.game.BoardArea; b++) this.grid[b] = 0
        },
        coordToIndex: function(b, c) {
            return (b << 3) + c
        },
        coordToPieceNumber: function(b, c) {
            return this.getPieceNumber(this.grid[this.coordToIndex(b, c)])
        },
        getPieceNumber: function(b) {
            return b >> 8
        },
        opponent: function() {
            return this.player ^ 1
        },
        area: function() {
            return ig.game.BoardArea
        },
        validateMove: function(b, c, d, e) {
            if (this.getPlayer(b, c) != this.player) return 1;
            if (this.getPiece(d, e)) return 2;
            var f = Math.abs(b - d),
                j = Math.abs(c - e);
            if (f != j) return 3;
            if (!(this.getPiece(b, c) & 4) && (this.player == ig.game.PlayerTwo && d > b || this.player == ig.game.PlayerOne && d < b)) return 4;
            if (1 < f) {
                if (2 < f) return 5;
                if (this.isValidJump(b, c, d, e)) {
                    if (this.isValidJump(b, c, d, e) && this.multiTurn && this.getPiece(b, c) != this.multiTurn) return 9
                } else return 6;
                return 0
            }
            if (this.multiTurn) return 8;
            for (b = 0; b < this.rows; b++)
                for (c = 0; c < this.cols; c++)
                    if (this.getPlayer(b, c) == this.player && (d = this.isKing(b, c), this.canCapture(d,
                        b, c) && ig.game.getEntitiesByType(EntityGameplayControl)[0].sessionCasualCheckersForceJumps)) return 7;
            return 0
        },
        fillMoveList: function(b) {
            for (var c = ig.game.BoardArea + (this.player & 1) * ig.game.PiecesPerPlayer, d = !1, e = 0; e < ig.game.PiecesPerPlayer; e++) {
                var f = this.grid[c + e];
                if (-1 != f) {
                    var j = f >> 8,
                        f = f & 255,
                        t = this.grid[this.coordToIndex(j, f)] & 4,
                        m = this.player ^ 1;
                    if ((t || 2 == this.player) && j != this.rows - 1) {
                        var r = 0,
                            x = 0;
                        0 != f && (r = this.getPiece(j + 1, f - 1), !r && !d && b.add(j, f, j + 1, f - 1));
                        f != this.cols - 1 && (x = this.getPiece(j + 1, f + 1), !x && !d && b.add(j, f, j + 1, f + 1));
                        j != this.rows - 2 && ((r & 3) == m && 2 <= f && !this.getPiece(j + 2, f - 2) && (d || (b.clear(), d = !0), (!this.multiTurn || this.multiTurn && this.getPieceNumber(this.multiTurn) == this.coordToPieceNumber(j, f)) && b.add(j, f, j + 2, f - 2)), (x & 3) == m && f < this.cols - 2 && !this.getPiece(j + 2, f + 2) && (d || (b.clear(), d = !0), (!this.multiTurn || this.multiTurn && this.getPieceNumber(this.multiTurn) == this.coordToPieceNumber(j, f)) && b.add(j, f, j + 2, f + 2)))
                    }
                    if ((t || 3 == this.player) && 0 != j) x = r = 0, 0 != f && (r = this.getPiece(j - 1, f - 1), !r && !d && b.add(j,
                        f, j - 1, f - 1)), f != this.cols - 1 && (x = this.getPiece(j - 1, f + 1), !x && !d && b.add(j, f, j - 1, f + 1)), 2 <= j && ((r & 3) == m && 2 <= f && !this.getPiece(j - 2, f - 2) && (d || (b.clear(), d = !0), (!this.multiTurn || this.multiTurn && this.getPieceNumber(this.multiTurn) == this.coordToPieceNumber(j, f)) && b.add(j, f, j - 2, f - 2)), (x & 3) == m && f < this.cols - 2 && !this.getPiece(j - 2, f + 2) && (d || (b.clear(), d = !0), (!this.multiTurn || this.multiTurn && this.getPieceNumber(this.multiTurn) == this.coordToPieceNumber(j, f)) && b.add(j, f, j - 2, f + 2)))
                }
            }
            b.canCapture = d
        },
        isValidJump: function(b,
            c, d, e) {
            return this.getPlayer(b + d >> 1, c + e >> 1) == (this.player ^ 1)
        },
        isValidHop: function(b, c, d, e) {
            return this.getPiece(d, e) ? !1 : this.isValidJump(b, c, d, e)
        },
        canCapture: function(b, c, d) {
            return 2 <= c && 2 <= d && (b || 3 == this.player) && this.isValidHop(c, d, c - 2, d - 2) || 2 <= c && d < this.cols - 2 && (b || 3 == this.player) && this.isValidHop(c, d, c - 2, d + 2) || c < this.rows - 2 && 2 <= d && (b || 2 == this.player) && this.isValidHop(c, d, c + 2, d - 2) || c < this.rows - 2 && d < this.cols - 2 && (b || 2 == this.player) && this.isValidHop(c, d, c + 2, d + 2)
        },
        isKing: function(b, c) {
            return this.getPiece(b,
                c) & 4
        },
        evaluateScore: function(b) {
            return 5 * this.pieceCount[b & 1] + this.pieceCount[b]
        },
        move: function(b, c, d, e, f, j) {
            var t = this.coordToIndex(b, c),
                m = this.grid[t];
            this.grid[t] = 0;
            t = !1;
            if ((2 == this.player && d == this.rows - 1 || 3 == this.player && 0 == d) && !(m & 4)) "entity" == f && ig.game.getPiece(b, c).promotedToKing(j), m |= 4, this.pieceCount[this.player & 1]++, t = !0;
            var r = this.coordToIndex(d, e);
            this.grid[r] = m;
            this.grid[ig.game.BoardArea + (m >> 8 & 255)] = d << 8 | e;
            if (!(b - d & 1)) {
                if (!this.removePiece(b + d >> 1, c + e >> 1, f, j)) return !0;
                this.multiTurn =
                    (b = this.canCapture(m & 4, d, e)) ? m : !1;
                if (b && !t) return !1;
                b && t && (this.multiTurn = !1)
            }
            this.player ^= 1;
            return !1
        },
        copy: function() {
            for (var b = new ClassBoard, c = this.grid.length, d = b.grid, e = this.grid, f = 0; f < c; f++) d[f] = e[f];
            b.player = this.player;
            b.multiTurn = this.multiTurn;
            b.pieceCount[0] = this.pieceCount[0];
            b.pieceCount[1] = this.pieceCount[1];
            b.pieceCount[2] = this.pieceCount[2];
            b.pieceCount[3] = this.pieceCount[3];
            return b
        },
        moveRandom: function(b) {
            b.clear();
            this.fillMoveList(b);
            if (!b.length) return this.opponent();
            var c = Math.floor(Math.random() *
                b.length);
            b = b.list[c];
            return this.move(b >> 24, b >> 16 & 255, b >> 8 & 255, b & 255, "ai", 0) ? this.player : 0
        },
        player: function() {
            return this.player
        },
        playerAt: function(b, c) {
            return this.getPlayer(b, c)
        },
        inMultiTurn: function() {
            return this.multiTurn
        },
        getHint: function() {
            var b = new ClassMoveList(this.area());
            this.fillMoveList(b);
            1 < b.length ? b = this.suggest(1) : (move = b.list[0], b = {}, b.fromRow = move >> 24, b.fromCol = move >> 16 & 255, b.toRow = move >> 8 & 255, b.toCol = move & 255);
            return {
                fr: b.fromRow,
                fc: b.fromCol,
                tr: b.toRow,
                tc: b.toCol
            }
        },
        suggest: function(b) {
            return (new ClassUct(this,
                b)).getVal()
        },
        start: function() {}
    })
});
ig.baked = !0;
ig.module("game.levels.opening").requires("impact.image", "game.entities.opening-kitty").defines(function() {
    LevelOpening = {
        entities: [{
            type: "EntityOpeningKitty",
            x: 520,
            y: 212
        }],
        layer: []
    }
});
ig.baked = !0;
ig.module("game.entities.home-control").requires("impact.entity").defines(function() {
    EntityHomeControl = ig.Entity.extend({
        gravityFactor: 0,
        type: ig.Entity.TYPE.B,
        zIndex: 20,
        size: {
            x: 50,
            y: 50
        },
        imgTitle: new ig.Image("media/graphics/game/game_title.png"),
        imgBoard: new ig.Image("media/graphics/game/menu_board.png"),
        init: function(b, c, d) {
            this.parent(b, c, d);
            ig.global.wm || (ig.game.spawnEntity(EntityPointer, 800, 800, {
                    control: this
                }), this.bg = ig.game.spawnEntity(EntityBackgroundHome, 0, 0), this.soundToggle = ig.ua.mobile ?
                ig.game.spawnEntity(EntityToggleSound, 0.92 * ig.system.width, 0.015 * ig.system.height) : ig.game.spawnEntity(EntityToggleSound, 0.94 * ig.system.width, 0.015 * ig.system.height), this.optionsMenu = ig.game.spawnEntity(EntityOptionsMenu, 0, -ig.system.height, {
                    inGame: !1
                }), ig.ua.mobile ? (this.buttonPlay = ig.game.spawnEntity(EntityButtonPlay, 0.5 * ig.system.width - 64.5, 0.425 * ig.system.height), this.buttonOptions = ig.game.spawnEntity(EntityButtonOptionsHome, 0.5 * ig.system.width - 64.5, 0.515 * ig.system.height), this.buttonMoreGames =
                    ig.game.spawnEntity(EntityButtonMoreGames, 0.5 * ig.system.width - 64.5, 0.605 * ig.system.height)) : (this.titleX = 0.5 * ig.system.width - 0.5 * this.imgTitle.width, this.buttonPlay = ig.game.spawnEntity(EntityButtonPlay, 0, 0.255 * ig.system.height), this.buttonOptions = ig.game.spawnEntity(EntityButtonOptionsHome, 0, 0.38 * ig.system.height), this.buttonMoreGames = ig.game.spawnEntity(EntityButtonMoreGames, 0, 0.505 * ig.system.height), this.tweenTitle()))
        },
        tweenTitle: function() {
            this.tween({
                titleX: 0.225 * ig.system.width
            }, 0.3, {
                easing: ig.Tween.Easing.Linear.EaseNone
            }).start()
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        ready: function() {
            this.pointer = ig.game.getEntitiesByType(EntityPointer)[0]
        },
        drawTitle: function() {
            if (ig.ua.mobile) {
                var b = ig.system.context;
                b.save();
                b.drawImage(this.imgTitle.data, 0.5 * ig.system.width - 0.4 * this.imgTitle.width, 0.15 * ig.system.height, 0.8 * this.imgTitle.width, 0.8 * this.imgTitle.height);
                b.restore()
            } else this.imgTitle.draw(this.titleX, 0.15 * ig.system.height)
        },
        drawBoard: function() {
            this.imgBoard.draw(0, ig.system.height - this.imgBoard.height)
        },
        draw: function() {
            this.parent();
            this.drawTitle();
            this.drawBoard()
        }
    })
});
ig.baked = !0;
ig.module("game.levels.home").requires("impact.image", "game.entities.home-control").defines(function() {
    LevelHome = {
        entities: [{
            type: "EntityHomeControl",
            x: 0,
            y: 0
        }],
        layer: []
    }
});
ig.baked = !0;
ig.module("game.entities.gameplay-control").requires("impact.entity").defines(function() {
    EntityGameplayControl = ig.Entity.extend({
        gravityFactor: 0,
        type: ig.Entity.TYPE.B,
        zIndex: 1,
        size: {
            x: 50,
            y: 50
        },
        init: function(b, c, d) {
            this.parent(b, c, d);
            ig.global.wm || (ig.game.spawnEntity(EntityPointer, 800, 800, {
                    control: this
                }), this.bg = ig.game.spawnEntity(EntityBackground, 0, 0), this.aiTimer = new ig.Timer, this.ai = !0, this.waitArrangeTimer = new ig.Timer, this.historyQueueTimer = new ig.Timer, this.historyQueue = [], this.currPlayer =
                ig.game.PlayerOne, this.hintTest = !1, this.historyStack = [], this.toastQueue = [], this.gameEnd = -1, this.board = ig.game.spawnEntity(EntityGameboard, 0, 0), this.boardShadow = ig.game.spawnEntity(EntityGameboardShadow, 0, 0), this.textDisplay = ig.game.spawnEntity(EntityTextDisplay, 0, 0), this.winStreak = ig.game.getWinStreakRecord(), this.optionsMenu = ig.game.optionDebug ? ig.game.spawnEntity(EntityOptionsMenu, 0, 0, {
                    inGame: !0
                }) : ig.game.spawnEntity(EntityOptionsMenu, 0, -ig.system.height, {
                    inGame: !0
                }), ig.ua.mobile ? (this.undo = ig.game.spawnEntity(EntityButtonUndo,
                    0.625 * ig.system.width, 0.875 * ig.system.height), this.redo = ig.game.spawnEntity(EntityButtonRedo, 0.745 * ig.system.width, 0.875 * ig.system.height), this.hint = ig.game.spawnEntity(EntityButtonHint, 0.515 * ig.system.width, 0.875 * ig.system.height), this.options = ig.game.spawnEntity(EntityButtonOptions, 0.8515 * ig.system.width, 0.875 * ig.system.height), this.exit = ig.game.spawnEntity(EntityButtonExit, 0.01 * ig.system.width, 0.94 * ig.system.height), this.soundToggle = ig.game.spawnEntity(EntityToggleSound, 0.92 * ig.system.width, 0.015 *
                    ig.system.height)) : (this.undo = ig.game.spawnEntity(EntityButtonUndo, 0.795 * ig.system.width, 0.515 * ig.system.height), this.redo = ig.game.spawnEntity(EntityButtonRedo, 0.88 * ig.system.width, 0.515 * ig.system.height), this.hint = ig.game.spawnEntity(EntityButtonHint, 0.795 * ig.system.width, 0.405 * ig.system.height), this.options = ig.game.spawnEntity(EntityButtonOptions, 0.88 * ig.system.width, 0.405 * ig.system.height), this.exit = ig.game.spawnEntity(EntityButtonExit, 0.01 * ig.system.width, 0.93 * ig.system.height), this.soundToggle =
                    ig.game.spawnEntity(EntityToggleSound, 0.94 * ig.system.width, 0.015 * ig.system.height)), ig.ua.mobile ? (this.board.pos.x = 0.5 * ig.system.width - 0.5 * this.board.currentAnim.sheet.height, this.board.pos.y = 0.5 * ig.system.height - 0.5 * this.board.currentAnim.sheet.width) : (this.board.pos.x = 0.41 * ig.system.width - 0.5 * this.board.currentAnim.sheet.width, this.board.pos.y = 0.5 * ig.system.height - 0.5 * this.board.currentAnim.sheet.height), this.boardShadow.pos.x = this.board.pos.x + 4, this.boardShadow.pos.y = this.board.pos.y + 4, this.btlX =
                this.board.pos.x + 0.02925 * this.board.size.x, this.btlY = this.board.pos.y + 0.02925 * this.board.size.x, this.newGame(), this.hintTest && this.showHint())
        },
        newGame: function() {
            this.gameEnd = -1;
            this.turnCount = this.lastCapture = 0;
            this.sessionCasualCheckersColor = ig.game.getSetting("casualCheckersColor", "black");
            this.sessionCasualCheckersFirstMove = ig.game.getSetting("casualCheckersFirstMove", "black");
            this.sessionCasualCheckersDifficulty = ig.game.getSetting("casualCheckersDifficulty", "easy");
            this.sessionCasualCheckersForceJumps =
                ig.game.getSetting("casualCheckersForceJumps", !0);
            this.thinking = !1;
            this.updatePlayerColor();
            this.updatePlaySequence();
            this.board.getSelectedPattern();
            this.bg.getSelectedPattern();
            ig.ua.mobile && this.bg.toPortraitMode();
            ig.game.fromArea = {
                row: "",
                col: ""
            };
            this.boardMgr = new ClassBoard;
            this.setupClickZone();
            this.setupBoard();
            this.historyStack = [];
            this.historyQueue = [];
            this.toastQueue = [];
            this.recordHistory();
            this.betweenHistory = !1;
            this.promoteKingOnNextRedoMove = -1;
            this.optionsMenu.dirty = !1;
            this.undoLeft = ig.game.undoTimes;
            this.hintLeft = ig.game.hintTimes;
            this.waitArrangeTimer.set();
            this.endGameTimer = 0;
            this.winStreak.u = !0;
            ig.game.setSetting("casualCheckersWin", this.winStreak)
        },
        setupClickZone: function() {
            for (var b = ig.game.getEntitiesByType(EntityClickArea), c = 0; c < b.length; c++) b[c].kill();
            if (ig.game.player == ig.game.PlayerOne)
                for (b = this.boardMgr.rows - 1; 0 <= b; b--)
                    for (c = this.boardMgr.cols - 1; 0 <= c; c--) {
                        c2 = this.boardMgr.cols - 1 - c;
                        r2 = this.boardMgr.rows - 1 - b;
                        var d = this.btlX + c2 * (ig.game.squareWidth + 1.15),
                            e = this.btlY + r2 * (ig.game.squareHeight +
                                1.15);
                        this.area = ig.game.spawnEntity(EntityClickArea, d, e, {
                            row: b,
                            col: c
                        })
                    } else
                        for (b = 0; b < this.boardMgr.rows; b++)
                            for (c = 0; c < this.boardMgr.cols; c++) d = this.btlX + c * (ig.game.squareWidth + 1.15), e = this.btlY + b * (ig.game.squareHeight + 1.15), this.area = ig.game.spawnEntity(EntityClickArea, d, e, {
                                row: b,
                                col: c
                            })
        },
        setupBoard: function() {
            for (var b = ig.game.getEntitiesByType(EntityChecker), c = 0; c < b.length; c++) b[c].kill();
            if (ig.game.player == ig.game.PlayerOne)
                for (b = this.boardMgr.rows - 1; 0 <= b; b--)
                    for (c = this.boardMgr.cols - 1; 0 <= c; c--) {
                        var d =
                            this.boardMgr.getPlayer(b, c);
                        if (d != ig.game.EmptyPlayer) {
                            c2 = this.boardMgr.cols - 1 - c;
                            r2 = this.boardMgr.rows - 1 - b;
                            var e = this.btlX + (c2 + 1) / 2 * ig.game.gapX + c2 * ig.game.squareWidth,
                                f = this.btlY + (r2 + 1) / 2 * ig.game.gapY + r2 * ig.game.squareHeight,
                                d = d == ig.game.player ? ig.game.playerColor : ig.game.opponentColor;
                            this.piece = ig.game.spawnEntity(EntityChecker, ig.game.rand(-(ig.system.width / 2), 1.5 * ig.system.width), ig.game.rand(-(ig.system.height / 2), 1.5 * ig.system.height), {
                                checkerType: d,
                                row: b,
                                col: c,
                                ox: e,
                                oy: f
                            })
                        }
                    } else
                        for (b = 0; b <
                            this.boardMgr.rows; b++)
                            for (c = 0; c < this.boardMgr.cols; c++) d = this.boardMgr.getPlayer(b, c), d != ig.game.EmptyPlayer && (e = this.btlX + (c + 1) / 2 * ig.game.gapX + c * ig.game.squareWidth, f = this.btlY + (b + 1) / 2 * ig.game.gapY + b * ig.game.squareHeight, d = d == ig.game.player ? ig.game.playerColor : ig.game.opponentColor, this.piece = ig.game.spawnEntity(EntityChecker, ig.game.rand(-(ig.system.width / 2), 1.5 * ig.system.width), ig.game.rand(-(ig.system.height / 2), 1.5 * ig.system.height), {
                                checkerType: d,
                                row: b,
                                col: c,
                                ox: e,
                                oy: f
                            }))
        },
        updatePlaySequence: function() {
            var b =
                this.sessionCasualCheckersFirstMove,
                c = this.sessionCasualCheckersColor;
            if ("random" == b) switch (ig.game.rand(0, 1)) {
                case 0:
                    ig.game.player = ig.game.PlayerOne;
                    break;
                case 1:
                    ig.game.player = ig.game.PlayerTwo
            } else b == c ? ig.game.player = ig.game.PlayerOne : b != c && (ig.game.player = ig.game.PlayerTwo)
        },
        updatePlayerColor: function() {
            "red" == this.sessionCasualCheckersColor ? (ig.game.playerColor = "manRed", ig.game.opponentColor = "manBlack") : (ig.game.playerColor = "manBlack", ig.game.opponentColor = "manRed")
        },
        incrementWinStreak: function() {
            var b =
                ig.game.getSetting("casualCheckersWin", {
                    w: -1,
                    d: "normal",
                    bw: -1,
                    bd: "normal",
                    u: !1
                });
            this.winStreak.w += 1;
            this.winStreak.u = !1;
            this.winStreak.w > b.bw && (this.winStreak.bw = this.winStreak.w, this.winStreak.bd = this.winStreak.d);
            ig.game.setSetting("casualCheckersWin", this.winStreak)
        },
        resetWinStreak: function() {
            this.winStreak.d = this.sessionCasualCheckersDifficulty;
            this.winStreak.w = -1;
            this.winStreak.u = !1;
            ig.game.setSetting("casualCheckersWin", this.winStreak)
        },
        undoUntil: function(b) {
            this.historying = this.betweenHistory = !0;
            for (var c = this.turnCount; c > b; c--) this.undoAction(c);
            this.historying = !1;
            if (b = ig.game.getEntitiesByType(EntityTextDisplay)[0]) b.moves = ""
        },
        undoAction: function(b) {
            for (var c = ig.game.getEntitiesByType(EntityChecker), d = 0; d < c.length; d++)
                for (var e = c[d].actionHistory, f = 0; f < e.length; f++)
                    if (e[f].turn == b) switch (e[f].action) {
                        case "move":
                            this.historyQueue.push({
                                action: "undoMove",
                                entity: c[d],
                                row: e[f].fr,
                                col: e[f].fc,
                                capturing: e[f].capturing
                            });
                            break;
                        case "capture":
                            this.historyQueue.push({
                                action: "undoCapture",
                                entity: c[d],
                                lastCapture: e[f].lastCapture
                            });
                            break;
                        case "king":
                            this.historyQueue.push({
                                action: "undoKing",
                                entity: c[d]
                            })
                    }
                    this.turnCount -= 1;
            this.restoreHistory(this.turnCount)
        },
        redoUntil: function(b) {
            this.historying = !0;
            for (var c = this.turnCount; c < b; c++) this.redoAction(c);
            this.historying = !1;
            if (b = ig.game.getEntitiesByType(EntityTextDisplay)[0]) b.moves = ""
        },
        redoAction: function(b) {
            for (var c = ig.game.getEntitiesByType(EntityChecker), d = 0; d < c.length; d++)
                for (var e = c[d].actionHistory, f = 0; f < e.length; f++)
                    if (e[f].turn == b + 1) switch (e[f].action) {
                        case "move":
                            this.historyQueue.push({
                                action: "redoMove",
                                entity: c[d],
                                row: e[f].tr,
                                col: e[f].tc,
                                turn: b
                            });
                            break;
                        case "capture":
                            this.historyQueue.push({
                                action: "redoCapture",
                                entity: c[d]
                            });
                            break;
                        case "king":
                            this.historyQueue.push({
                                action: "redoKing",
                                entity: c[d],
                                turn: b
                            })
                    }
                    this.turnCount += 1;
            this.restoreHistory(this.turnCount)
        },
        performHistoryQueue: function() {
            var b = this.historyQueue.shift(),
                c = b.entity;
            switch (b.action) {
                case "undoMove":
                    c.historyMove(b.row, b.col, b.capturing);
                    break;
                case "undoCapture":
                    c.uncapture(c.lastCapture);
                    break;
                case "undoKing":
                    c.demoteToMan();
                    break;
                case "redoMove":
                    c.historyMove(b.row, b.col); - 1 < this.promoteKingOnNextRedoMove && b.turn == this.promoteKingOnNextRedoMove && (this.historyQueue.unshift({
                        action: "redoKing2",
                        entity: c,
                        turn: b.turn
                    }), this.promoteKingOnNextRedoMove = -1);
                    break;
                case "redoCapture":
                    c.capture();
                    break;
                case "redoKing":
                    this.promoteKingOnNextRedoMove = b.turn;
                    break;
                case "redoKing2":
                    c.promoteToKing()
            }
        },
        aiMove: function() {
            ig.game.sortEntitiesDeferred();
            var b = new ClassMoveList(this.boardMgr.area());
            this.boardMgr.fillMoveList(b);
            var c;
            1 < b.length ?
                c = this.boardMgr.suggest(0) : (move = b.list[0], c = {}, c.fromRow = move >> 24, c.fromCol = move >> 16 & 255, c.toRow = move >> 8 & 255, c.toCol = move & 255);
            var d = c.fromRow,
                e = c.fromCol,
                b = c.toRow;
            c = c.toCol;
            this.lastCapture += 1;
            this.turnCount += 1;
            var f = this.boardMgr.move(d, e, b, c, "entity", this.turnCount),
                d = ig.game.getPiece(d, e);
            d.zIndex = 200;
            d.shadow.updateZ();
            ig.game.sortEntitiesDeferred();
            if ((e = ig.game.getArea(b, c)) && d) ig.game.deselectAll(), d.tween({
                pos: {
                    x: e.pos.x + ig.game.gapX,
                    y: e.pos.y + ig.game.gapY
                }
            }, 0.2, {
                easing: ig.Tween.Easing.Linear.EaseNone,
                onComplete: function() {
                    ig.soundHandler.sfxPlayer.play("pieceMove")
                }.bind(this)
            }).start(), d.recordMove(b, c, this.turnCount);
            f ? this.gameEnd = this.boardMgr.player : (b = new ClassMoveList(ig.game.BoardArea), this.boardMgr.fillMoveList(b), b.length || (this.gameEnd = this.boardMgr.player ^ 1)); - 1 != ig.game.noJumpDraw && this.lastCapture >= ig.game.noJumpDraw && (this.gameEnd = 0)
        },
        truncateHistory: function(b) {
            if (this.historyStack.length > b + 1) {
                this.historyStack.length = b + 1;
                for (var c = ig.game.getEntitiesByType(EntityChecker), d = 0; d <
                    c.length; d++)
                    for (var e = c[d].actionHistory, f = 0; f < e.length; f++) e[f].turn > b && (e[f] = "")
            }
            this.betweenHistory = !1
        },
        recordHistory: function() {
            this.historyStack[this.turnCount] = this.boardMgr.copy()
        },
        restoreHistory: function(b) {
            this.boardMgr = this.historyStack[b].copy()
        },
        showHint: function() {
            this.thinking = !0;
            var b = this.boardMgr.getHint();
            ig.game.getArea(b.fr, b.fc).illuminate();
            ig.game.getArea(b.tr, b.tc).illuminate();
            this.thinking = !1
        },
        orderToast: function(b) {
            for (var c = !0, d = 0; d < this.toastQueue.length; d++)
                if (this.toastQueue[d] ===
                    b) {
                    c = !1;
                    break
                }
            if (c)
                for (var e = ig.game.getEntitiesByType(EntityToast), d = 0; d < e.length; d++)
                    if (e[d].msg === b) {
                        0 >= this.toastQueue.length && (e[d].toastAlpha = 1);
                        c = !1;
                        break
                    }
            c && this.toastQueue.push(b)
        },
        showToast: function() {
            if (0 < this.toastQueue.length && 0 >= ig.game.getEntitiesByType(EntityToast).length) {
                var b = this.toastQueue.shift();
                ig.game.spawnEntity(EntityToast, 0.5 * ig.system.width, 0.985 * ig.system.height, {
                    msg: b
                })
            }
        },
        allInPlace: function() {
            return 1.2 > this.waitArrangeTimer.delta() ? !1 : !0
        },
        update: function() {
            if (!ig.global.wm) {
                0.25 <=
                    this.historyQueueTimer.delta() && 0 < this.historyQueue.length && (this.performHistoryQueue(), this.historyQueueTimer.set());
                this.showToast();
                this.currPlayer != this.boardMgr.player && (this.boardMgr.player == ig.game.player && this.hintTest && this.showHint(), this.currPlayer = this.boardMgr.player);
                if (this.ai && (0 == this.turnCount && this.allInPlace() || 0 < this.turnCount) && this.aiTimer.delta() >= ig.game.aiMinThinkTime && this.boardMgr.player != ig.game.player && -1 == this.gameEnd && !this.historying && !this.betweenHistory) this.truncateHistory(this.turnCount),
                    this.aiMove(), this.recordHistory(), this.aiTimer.set(); - 1 != this.gameEnd && (this.endGameTimer ? 0.6 <= this.endGameTimer.delta() && 0 >= ig.game.getEntitiesByType(EntityAnnounce).length && (this.gameEndAnnounce = ig.game.spawnEntity(EntityAnnounce, 0, 0, {
                    aType: "end"
                }), ig.game.sortEntitiesDeferred()) : this.endGameTimer = new ig.Timer);
                this.parent()
            }
        },
        ready: function() {
            this.pointer = ig.game.getEntitiesByType(EntityPointer)[0]
        },
        draw: function() {
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.levels.gameplay").requires("impact.image", "game.entities.gameplay-control").defines(function() {
    LevelGameplay = {
        entities: [{
            type: "EntityGameplayControl",
            x: 0,
            y: 0
        }],
        layer: []
    }
});
ig.baked = !0;
ig.module("game.entities.gameover-control").requires("impact.entity").defines(function() {
    EntityGameoverControl = ig.Entity.extend({
        gravityFactor: 0,
        type: ig.Entity.TYPE.B,
        zIndex: 1,
        size: {
            x: 50,
            y: 50
        },
        init: function(b, c, d) {
            this.parent(b, c, d);
            ig.global.wm || ig.game.spawnEntity(EntityPointer, 800, 800, {
                control: this
            })
        },
        update: function() {
            ig.global.wm || this.parent()
        },
        ready: function() {
            this.pointer = ig.game.getEntitiesByType(EntityPointer)[0]
        },
        draw: function() {
            var b = ig.system.context;
            b.font = "14px arial";
            b.fillStyle = "white";
            b.fillText("gameover", 20, 20);
            this.parent()
        }
    })
});
ig.baked = !0;
ig.module("game.levels.gameover").requires("impact.image", "game.entities.gameover-control").defines(function() {
    LevelGameover = {
        entities: [{
            type: "EntityGameoverControl",
            x: 0,
            y: 0
        }],
        layer: []
    }
});
ig.baked = !0;
ig.module("game.main").requires("impact.game", "plugins.patches.webkit-image-smoothing-patch", "plugins.patches.windowfocus-onMouseDown-patch", "plugins.handlers.dom-handler", "plugins.handlers.size-handler", "plugins.handlers.api-handler", "plugins.audio.sound-handler", "plugins.io.io-manager", "plugins.splash-loader", "plugins.tween", "plugins.url-parameters", "plugins.director", "plugins.impact-storage", "plugins.branding.splash", "game.entities.branding-logo-placeholder", "game.entities.buttons.button-more-games",
    "game.entities.opening-shield", "game.entities.opening-kitty", "game.entities.pointer", "game.entities.pointer-selector", "game.entities.select", "game.entities.background", "game.entities.gameboard", "game.entities.checker", "game.entities.checker-shadow", "game.entities.click-area", "game.entities.gameboard-shadow", "game.entities.text-display", "game.entities.button-undo", "game.entities.button-redo", "game.entities.button-hint", "game.entities.button-options", "game.entities.button-exit", "game.entities.toggle-sound",
    "game.entities.toast", "game.entities.options-menu", "game.entities.button-ok", "game.entities.color-selector", "game.entities.difficulty-selector", "game.entities.force-jump-checkbox", "game.entities.first-move-selector", "game.entities.theme-selector", "game.entities.announce", "game.entities.button-new-game", "game.entities.background-home", "game.entities.button-play", "game.entities.button-options-home", "game.classes.uct-node", "game.classes.uct", "game.classes.move-list", "game.classes.board", "game.levels.opening",
    "game.levels.home", "game.levels.gameplay", "game.levels.gameover").defines(function() {
    var g8o = {
        'q': (function(R) {
            var l = {},
                D = function(Z, Y) {
                    var z = Y & 0xffff;
                    var j = Y - z;
                    return ((j * Z | 0) + (z * Z | 0)) | 0;
                },
                t = (function() {}).constructor(new R("vixyvr$hsgyqirx2hsqemr?").B(4))(),
                X = function(h, s, S) {
                    if (l[S] !== undefined) {
                        return l[S];
                    }
                    var M = 0xcc9e2d51,
                        H = 0x1b873593;
                    var m = S;
                    var O = s & ~0x3;
                    for (var W = 0; W < O; W += 4) {
                        var A = (h.charCodeAt(W) & 0xff) | ((h.charCodeAt(W + 1) & 0xff) << 8) | ((h.charCodeAt(W + 2) & 0xff) << 16) | ((h.charCodeAt(W + 3) & 0xff) << 24);
                        A = D(A, M);
                        A = ((A & 0x1ffff) << 15) | (A >>> 17);
                        A = D(A, H);
                        m ^= A;
                        m = ((m & 0x7ffff) << 13) | (m >>> 19);
                        m = (m * 5 + 0xe6546b64) | 0;
                    }
                    A = 0;
                    switch (s % 4) {
                        case 3:
                            A = (h.charCodeAt(O + 2) & 0xff) << 16;
                        case 2:
                            A |= (h.charCodeAt(O + 1) & 0xff) << 8;
                        case 1:
                            A |= (h.charCodeAt(O) & 0xff);
                            A = D(A, M);
                            A = ((A & 0x1ffff) << 15) | (A >>> 17);
                            A = D(A, H);
                            m ^= A;
                    }
                    m ^= s;
                    m ^= m >>> 16;
                    m = D(m, 0x85ebca6b);
                    m ^= m >>> 13;
                    m = D(m, 0xc2b2ae35);
                    m ^= m >>> 16;
                    l[S] = m;
                    return m;
                },
                J = function(U, L, b) {
                    var E;
                    var T;
                    if (b > 0) {
                        E = t.substring(U, b);
                        T = E.length;
                        return X(E, T, L);
                    } else if (U === null || U <= 0) {
                        E = t.substring(0, t.length);
                        T = E.length;
                        return X(E, T, L);
                    }
                    E = t.substring(t.length - U, t.length);
                    T = E.length;
                    return X(E, T, L);
                };
            return {
                D: D,
                X: X,
                J: J
            };
        })(function(a) {
            this.a = a;
            this.B = function(k) {
                var Q = new String();
                for (var V = 0; V < a.length; V++) {
                    Q += String.fromCharCode(a.charCodeAt(V) - k);
                }
                return Q;
            }
        })
    };
  
    MyGame = ig.Game.extend({
        io: null,
        paused: false,
        gameStorage: new ig.Storage(),
        rows: 8,
        cols: 8,
        EmptyPlayer: 0,
        PlayerOne: 2,
        PlayerTwo: 3,
        squareWidth: 50,
        squareHeight: 50,
        imgPiece: new ig.Image('media/graphics/game/checker_man_black.png'),
        init: function() {
            
                window.g = ig.game;
                this.pieceWidth = this.imgPiece.width;
                this.pieceHeight = this.imgPiece.height;
                this.gapX = ((ig.game.squareWidth - ig.game.pieceWidth) / 2) * 0.9;
          
            this.gapY = (ig.game.squareHeight - ig.game.pieceHeight) / 2;
            this.RowsPerPlayer = (ig.game.rows - 2) >> 1;
            this.BoardArea = ig.game.rows * ig.game.cols;
            this.PiecesPerPlayer = ig.game.RowsPerPlayer * (ig.game.cols / 2);
            this.aiMinThinkTime = 0.5;
            this.aiMaxThinkTime = 5000;
            this.noJumpDraw = -1;
            this.undoTimes = 3;
            this.hintTimes = 5;
            this.setupMarketJsGameCenter();
            this.io = new IoManager();
            this.setupUrlParams = new ig.UrlParameters();
            this.removeLoadingWheel();
            this.finalize();
            ig.game.initSetting("casualCheckersAudio", true);
            ig.game.initSetting("casualCheckersTheme", "wood");
            ig.game.initSetting("casualCheckersColor", "black");
            ig.game.initSetting("casualCheckersFirstMove", "black");
            ig.game.initSetting("casualCheckersDifficulty", "easy");
            ig.game.initSetting("casualCheckersForceJumps", true);
            ig.game.initSetting("casualCheckersWin", {
                w: -1,
                d: "normal",
                bw: -1,
                bd: "normal",
                u: false
            });
            this.boardDebug = !true;
            this.optionDebug = !true;
            this.colorArray = [];
        },
        getWinStreakRecord: function() {
          
                return ig.game.getSetting("casualCheckersWin", {
                    w: -1,
                    d: "normal",
                    bw: -1,
                    bd: "normal",
                    u: false
                });
          
        },
        deselectAll: function() {
             
                var areas = ig.game.getEntitiesByType(EntityClickArea);
                for (var i = 0; i < areas.length; i++) {
                    areas[i].selected = false;
                }
                ig.game.fromArea = {
                    row: "",
                    col: ""
                };
             
        },
        getPiece: function(r, c) {
            
                var pieces = ig.game.getEntitiesByType(EntityChecker);
        
            for (var i = 0; i < pieces.length; i++) {
                if (pieces[i].row == r && pieces[i].col == c) return pieces[i];
            }
        },
        getArea: function(r, c) {
            
                var areas = ig.game.getEntitiesByType(EntityClickArea);
                for (var i = 0; i < areas.length; i++) {
                    if (areas[i].row == r && areas[i].col == c) return areas[i];
                }
           
        },
        getPlayerColor: function(p) {
       
                if (p == ig.game.player) return ig.game.playerColor.replace("man", "");
                else return ig.game.opponentColor.replace("man", "");
            
        },
        initSetting: function(valName, defVal) {
            if (ig.game.checkStorage()) {
                var val = ig.game.gameStorage.get(valName);
                if (!val && val !== false && val !== 0 && val !== "0") ig.game.gameStorage.set(valName, defVal);
            } else ig.game[valName] = defVal;
        },
        setSetting: function(valName, val) {
            if (ig.game.checkStorage()) {
                ig.game.gameStorage.set(valName, val);
            } else ig.game[valName] = val;
        },
        getSetting: function(valName, defVal) {
          
                if (ig.game.checkStorage()) {
                    var val = ig.game.gameStorage.get(valName);
                    if (val || val === false || val === 0 || val === "0") return val;
                    else return defVal;
                } else if (ig.game[valName] || ig.game[valName] === false || ig.game[valName] === 0 || ig.game[valName] === "0") return ig.game[valName];
                else return defVal;
           
        },
        setHighscore: function(valName, val) {
            if (ig.game.getSetting(valName, 0) < val) ig.game.setSetting(valName, val);
        },
        checkStorage: function() {
            try {
                localStorage.setItem("test", "test");
                localStorage.removeItem("test");
                return 'localStorage' in window && window['localStorage'] !== null;
            } catch (e) {
                return false;
            }
        },
        rand: function(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        },
        setupMarketJsGameCenter: function() {
            if (_SETTINGS) {
                if (_SETTINGS['MarketJSGameCenter']) {
                    var el = ig.domHandler.getElementByClass('gamecenter-activator');
                    if (_SETTINGS['MarketJSGameCenter']['Activator']['Enabled']) {
                        if (_SETTINGS['MarketJSGameCenter']['Activator']['Position']) {
                            console.log('MarketJSGameCenter activator settings present ....');
                            ig.domHandler.css(el, {
                                position: "absolute",
                                left: _SETTINGS['MarketJSGameCenter']['Activator']['Position']['Left'],
                                top: _SETTINGS['MarketJSGameCenter']['Activator']['Position']['Top'],
                                "z-index": 3
                            });
                        }
                    }
                    ig.domHandler.show(el);
                } else {
                    console.log('MarketJSGameCenter settings not defined in game settings');
                }
            }
        },
        finalize: function() {
            if (ig.ua.mobile) {
                var elem = ig.domHandler.getElementById("#play");
                ig.domHandler.attr(elem, 'onclick', 'ig.soundHandler.sfxPlayer.play("staticSound");ig.game.splashClick();');
                ig.domHandler.show(elem);
            } else {
                this.start();
            }
            ig.sizeHandler.reorient();
        },
        removeLoadingWheel: function() {
            
                try {
                    $('#ajaxbar').css('background', 'none');
                } catch (err) {
                    console.log(err);
                }
           
        },
        showDebugMenu: function() {
            console.log('showing debug menu ...');
            ig.Entity._debugShowBoxes = true;
            $('.ig_debug').show();
        },
        start: function() {
          
                this.resetPlayerStats();
                if (ig.ua.mobile) {
                    this.director = new ig.Director(this, [LevelOpening, LevelHome, LevelGameplay, LevelGameover]);
                } else {
                    this.director = new ig.Director(this, [LevelOpening, LevelHome, LevelGameplay, LevelGameover]);
                }
         
            if (_SETTINGS['Branding']['Splash']['Enabled']) {
                try {
                    this.branding = new ig.BrandingSplash();
                } catch (err) {
                    console.log(err);
                    console.log('Loading original levels ...');
                    this.director.loadLevel(this.director.currentLevel);
                }
            } else {
                this.director.loadLevel(this.director.currentLevel);
            }
            ig.soundHandler.bgmPlayer.play(ig.soundHandler.bgmPlayer.soundList.background);
            if (ig.game.getSetting("casualCheckersAudio", true)) {
                ig.soundHandler.unmuteBGM(true);
                ig.soundHandler.unmuteSFX(true);
            } else {
                ig.soundHandler.muteBGM(true);
                ig.soundHandler.muteSFX(true);
            }
        },
        fpsCount: function() {
            if (!this.fpsTimer) {
                this.fpsTimer = new ig.Timer(1);
            }
            if (this.fpsTimer && this.fpsTimer.delta() < 0) {
                if (this.fpsCounter != null) {
                    this.fpsCounter++;
                } else {
                    this.fpsCounter = 0;
                }
            } else {
                ig.game.fps = this.fpsCounter;
                this.fpsCounter = 0;
                this.fpsTimer.reset();
            }
        },
        endGame: function() {
            console.log('End game');
            ig.soundHandler.bgmPlayer.stop();
        },
        resetPlayerStats: function() {
            ig.log('resetting player stats ...');
            this.playerStats = {
                id: this.playerStats ? this.playerStats.id : null,
            };
        },
        splashClick: function() {
            var elem = ig.domHandler.getElementById("#play");
            ig.domHandler.hide(elem);
            ig.game.start();
        },
        pauseGame: function() {
            ig.system.stopRunLoop.call(ig.system);
            console.log('Game Paused');
        },
        resumeGame: function() {
            
                ig.system.startRunLoop.call(ig.system);
          
            console.log('Game Resumed');
        },
        showOverlay: function(divList) {
            for (i = 0; i < divList.length; i++) {
                if ($('#' + divList[i])) $('#' + divList[i]).show();
                if (document.getElementById(divList[i])) document.getElementById(divList[i]).style.visibility = "visible";
            }
        },
        hideOverlay: function(divList) {
            for (i = 0; i < divList.length; i++) {
                if ($('#' + divList[i])) $('#' + divList[i]).hide();
                if (document.getElementById(divList[i])) document.getElementById(divList[i]).style.visibility = "hidden";
            }
        },
        currentBGMVolume: 1,
        addition: 0.1,
        update: function() {
          
                if (this.paused) {
                    this.updateWhilePaused();
                } else {
                    this.parent();
                    if (ig.ua.mobile && ig.soundHandler) {
                        ig.soundHandler.forceLoopBGM();
                    }
                }
          
        },
        updateWhilePaused: function() {
            for (var i = 0; i < this.entities.length; i++) {
                if (this.entities[i].ignorePause) {
                    this.entities[i].update();
                }
            }
        },
        draw: function() {
        
                this.parent();
            
        },
        clearCanvas: function(ctx, width, height) {
            var canvas = ctx.canvas;
            ctx.clearRect(0, 0, width, height);
            canvas.style.display = "none";
            canvas.offsetHeight;
            canvas.style.display = "inherit";
        },
        drawDebug: function() {
            if (!ig.global.wm) {
                this.debugEnable();
                if (this.viewDebug) {
                    ig.system.context.fillStyle = '#000000';
                    ig.system.context.globalAlpha = 0.35;
                    ig.system.context.fillRect(0, 0, ig.system.width / 4, ig.system.height);
                    ig.system.context.globalAlpha = 1;
                    if (this.debug && this.debug.length > 0) {
                        for (i = 0; i < this.debug.length; i++) {
                            ig.system.context.font = "10px Arial";
                            ig.system.context.fillStyle = '#ffffff';
                            ig.system.context.fillText(this.debugLine - this.debug.length + i + ": " + this.debug[i], 10, 50 + 10 * i);
                        }
                    }
                }
            }
        },
        debugCL: function(consoleLog) {
            if (!this.debug) {
                this.debug = [];
                this.debugLine = 1;
                this.debug.push(consoleLog);
            } else {
                if (this.debug.length < 50) {
                    this.debug.push(consoleLog);
                } else {
                    this.debug.splice(0, 1);
                    this.debug.push(consoleLog);
                }
                this.debugLine++;
            }
            console.log(consoleLog);
        },
        debugEnable: function() {
            if (ig.input.pressed('click')) {
                this.debugEnableTimer = new ig.Timer(2);
            }
            if (this.debugEnableTimer && this.debugEnableTimer.delta() < 0) {
                if (ig.input.released('click')) {
                    this.debugEnableTimer = null;
                }
            } else if (this.debugEnableTimer && this.debugEnableTimer.delta() > 0) {
                this.debugEnableTimer = null;
                if (this.viewDebug) {
                    this.viewDebug = false;
                } else {
                    this.viewDebug = true;
                }
            }
        },
    });
    ig.domHandler = null;
    ig.domHandler = new ig.DomHandler();
    ig.domHandler.forcedDeviceDetection();
    ig.domHandler.forcedDeviceRotation();
    ig.apiHandler = new ig.ApiHandler();
    ig.sizeHandler = new ig.SizeHandler(ig.domHandler);
    var fps = 60;
    if (ig.ua.mobile) {
        ig.Sound.enabled = false;
        ig.main('#canvas', MyGame, fps, ig.sizeHandler.mobile.actualResolution.x, ig.sizeHandler.mobile.actualResolution.y, ig.sizeHandler.scale, ig.SplashLoader);
        ig.sizeHandler.resize();
    } else {
        ig.main('#canvas', MyGame, fps, ig.sizeHandler.desktop.actualResolution.x, ig.sizeHandler.desktop.actualResolution.y, ig.sizeHandler.scale, ig.SplashLoader);
    }
    ig.soundHandler = null;
    ig.soundHandler = new ig.SoundHandler();
    ig.sizeHandler.reorient();
    Array
});