window.Modernizr=function(e,t,n){function r(e){p.cssText=e}function o(e,t){return typeof e===t}var i,a,c="2.7.1",l={},s=!0,u=t.documentElement,d="modernizr",f=t.createElement(d),p=f.style,h=({}.toString," -webkit- -moz- -o- -ms- ".split(" ")),m={},v=[],y=v.slice,g=function(e,n,r,o){var i,a,c,l,s=t.createElement("div"),f=t.body,p=f||t.createElement("body");if(parseInt(r,10))for(;r--;)(c=t.createElement("div")).id=o?o[r]:d+(r+1),s.appendChild(c);return i=["&#173;",'<style id="s',d,'">',e,"</style>"].join(""),s.id=d,(f?s:p).innerHTML+=i,p.appendChild(s),f||(p.style.background="",p.style.overflow="hidden",l=u.style.overflow,u.style.overflow="hidden",u.appendChild(p)),a=n(s,e),f?s.parentNode.removeChild(s):(p.parentNode.removeChild(p),u.style.overflow=l),!!a},E={}.hasOwnProperty;for(var b in a=o(E,"undefined")||o(E.call,"undefined")?function(e,t){return t in e&&o(e.constructor.prototype[t],"undefined")}:function(e,t){return E.call(e,t)},Function.prototype.bind||(Function.prototype.bind=function(e){var t=this;if("function"!=typeof t)throw new TypeError;var n=y.call(arguments,1),r=function(){if(this instanceof r){var o=function(){};o.prototype=t.prototype;var i=new o,a=t.apply(i,n.concat(y.call(arguments)));return Object(a)===a?a:i}return t.apply(e,n.concat(y.call(arguments)))};return r}),m.touch=function(){var n;return"ontouchstart"in e||e.DocumentTouch&&t instanceof DocumentTouch?n=!0:g(["@media (",h.join("touch-enabled),("),d,")","{#modernizr{top:9px;position:absolute}}"].join(""),function(e){n=9===e.offsetTop}),n},m)a(m,b)&&(i=b.toLowerCase(),l[i]=m[b](),v.push((l[i]?"":"no-")+i));return l.addTest=function(e,t){if("object"==typeof e)for(var r in e)a(e,r)&&l.addTest(r,e[r]);else{if(e=e.toLowerCase(),l[e]!==n)return l;t="function"==typeof t?t():t,void 0!==s&&s&&(u.className+=" "+(t?"":"no-")+e),l[e]=t}return l},r(""),f=null,l._version=c,l._prefixes=h,l.testStyles=g,u.className=u.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(s?" js "+v.join(" "):""),l}(this,this.document),function(e,t){function n(e,t){var n=e.createElement("p"),r=e.getElementsByTagName("head")[0]||e.documentElement;return n.innerHTML="x<style>"+t+"</style>",r.insertBefore(n.lastChild,r.firstChild)}function r(){var e=T.elements;return"string"==typeof e?e.split(" "):e}function o(e){var t=S[e[b]];return t||(t={},j++,e[b]=j,S[j]=t),t}function i(e,n,r){return n||(n=t),m?n.createElement(e):(r||(r=o(n)),!(i=r.cache[e]?r.cache[e].cloneNode():E.test(e)?(r.cache[e]=r.createElem(e)).cloneNode():r.createElem(e)).canHaveChildren||g.test(e)||i.tagUrn?i:r.frag.appendChild(i));var i}function a(e,n){if(e||(e=t),m)return e.createDocumentFragment();for(var i=(n=n||o(e)).frag.cloneNode(),a=0,c=r(),l=c.length;a<l;a++)i.createElement(c[a]);return i}function c(e,t){t.cache||(t.cache={},t.createElem=e.createElement,t.createFrag=e.createDocumentFragment,t.frag=t.createFrag()),e.createElement=function(n){return T.shivMethods?i(n,e,t):t.createElem(n)},e.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+r().join().replace(/\w+/g,function(e){return t.createElem(e),t.frag.createElement(e),'c("'+e+'")'})+");return n}")(T,t.frag)}function l(e){e||(e=t);var r=o(e);return T.shivCSS&&!h&&!r.hasCSS&&(r.hasCSS=!!n(e,"article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}")),m||c(e,r),e}function s(e){for(var t,n=e.getElementsByTagName("*"),o=n.length,i=RegExp("^(?:"+r().join("|")+")$","i"),a=[];o--;)t=n[o],i.test(t.nodeName)&&a.push(t.applyElement(u(t)));return a}function u(e){for(var t,n=e.attributes,r=n.length,o=e.ownerDocument.createElement(N+":"+e.nodeName);r--;)(t=n[r]).specified&&o.setAttribute(t.nodeName,t.nodeValue);return o.style.cssText=e.style.cssText,o}function d(e){for(var t,n=e.split("{"),o=n.length,i=RegExp("(^|[\\s,>+~])("+r().join("|")+")(?=[[\\s,>+~#.:]|$)","gi"),a="$1"+N+"\\:$2";o--;)(t=n[o]=n[o].split("}"))[t.length-1]=t[t.length-1].replace(i,a),n[o]=t.join("}");return n.join("{")}function f(e){for(var t=e.length;t--;)e[t].removeNode()}function p(e){function t(){clearTimeout(c._removeSheetTimer),i&&i.removeNode(!0),i=null}var i,a,c=o(e),l=e.namespaces,u=e.parentWindow;return!C||e.printShived?e:("undefined"==typeof l[N]&&l.add(N),u.attachEvent("onbeforeprint",function(){t();for(var o,c,l,u=e.styleSheets,f=[],p=u.length,h=Array(p);p--;)h[p]=u[p];for(;l=h.pop();)if(!l.disabled&&w.test(l.media)){try{c=(o=l.imports).length}catch(r){c=0}for(p=0;p<c;p++)h.push(o[p]);try{f.push(l.cssText)}catch(r){}}f=d(f.reverse().join("")),a=s(e),i=n(e,f)}),u.attachEvent("onafterprint",function(){f(a),clearTimeout(c._removeSheetTimer),c._removeSheetTimer=setTimeout(t,500)}),e.printShived=!0,e)}var h,m,v="3.7.0",y=e.html5||{},g=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,E=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,b="_html5shiv",j=0,S={};!function(){try{var e=t.createElement("a");e.innerHTML="<xyz></xyz>",h="hidden"in e,m=1==e.childNodes.length||function(){t.createElement("a");var e=t.createDocumentFragment();return"undefined"==typeof e.cloneNode||"undefined"==typeof e.createDocumentFragment||"undefined"==typeof e.createElement}()}catch(v){h=!0,m=!0}}();var T={elements:y.elements||"abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output progress section summary template time video",version:v,shivCSS:!1!==y.shivCSS,supportsUnknownElements:m,shivMethods:!1!==y.shivMethods,type:"default",shivDocument:l,createElement:i,createDocumentFragment:a};e.html5=T,l(t);var w=/^$|\b(?:all|print)\b/,N="html5shiv",C=!m&&function(){var n=t.documentElement;return"undefined"!=typeof t.namespaces&&"undefined"!=typeof t.parentWindow&&"undefined"!=typeof n.applyElement&&"undefined"!=typeof n.removeNode&&"undefined"!=typeof e.attachEvent}();T.type+=" print",T.shivPrint=p,p(t)}(this,document),function(e,t,n){function r(e){return"[object Function]"==v.call(e)}function o(e){return"string"==typeof e}function i(){}function a(e){return!e||"loaded"==e||"complete"==e||"uninitialized"==e}function c(){var e=y.shift();g=1,e?e.t?h(function(){("c"==e.t?f.injectCss:f.injectJs)(e.s,0,e.a,e.x,e.e,1)},0):(e(),c()):g=0}function l(e,n,r,o,i,l,s){function u(t){if(!p&&a(d.readyState)&&(E.r=p=1,!g&&c(),d.onload=d.onreadystatechange=null,t))for(var r in"img"!=e&&h(function(){j.removeChild(d)},50),C[n])C[n].hasOwnProperty(r)&&C[n][r].onload()}s=s||f.errorTimeout;var d=t.createElement(e),p=0,v=0,E={t:r,s:n,e:i,a:l,x:s};1===C[n]&&(v=1,C[n]=[]),"object"==e?d.data=n:(d.src=n,d.type=e),d.width=d.height="0",d.onerror=d.onload=d.onreadystatechange=function(){u.call(this,v)},y.splice(o,0,E),"img"!=e&&(v||2===C[n]?(j.insertBefore(d,b?null:m),h(u,s)):C[n].push(d))}function s(e,t,n,r,i){return g=0,t=t||"j",o(e)?l("c"==t?T:S,e,t,this.i++,n,r,i):(y.splice(this.i++,0,e),1==y.length&&c()),this}function u(){var e=f;return e.loader={load:s,i:0},e}var d,f,p=t.documentElement,h=e.setTimeout,m=t.getElementsByTagName("script")[0],v={}.toString,y=[],g=0,E="MozAppearance"in p.style,b=E&&!!t.createRange().compareNode,j=b?p:m.parentNode,S=(p=e.opera&&"[object Opera]"==v.call(e.opera),p=!!t.attachEvent&&!p,E?"object":p?"script":"img"),T=p?"script":S,w=Array.isArray||function(e){return"[object Array]"==v.call(e)},N=[],C={},x={timeout:function(e,t){return t.length&&(e.timeout=t[0]),e}};(f=function(e){function t(e){e=e.split("!");var t,n,r,o=N.length,i=e.pop(),a=e.length;i={url:i,origUrl:i,prefixes:e};for(n=0;n<a;n++)r=e[n].split("="),(t=x[r.shift()])&&(i=t(i,r));for(n=0;n<o;n++)i=N[n](i);return i}function a(e,o,i,a,c){var l=t(e),s=l.autoCallback;l.url.split(".").pop().split("?").shift(),l.bypass||(o&&(o=r(o)?o:o[e]||o[a]||o[e.split("/").pop().split("?")[0]]),l.instead?l.instead(e,o,i,a,c):(C[l.url]?l.noexec=!0:C[l.url]=1,i.load(l.url,l.forceCSS||!l.forceJS&&"css"==l.url.split(".").pop().split("?").shift()?"c":n,l.noexec,l.attrs,l.timeout),(r(o)||r(s))&&i.load(function(){u(),o&&o(l.origUrl,c,a),s&&s(l.origUrl,c,a),C[l.url]=2})))}function c(e,t){function n(e,n){if(e){if(o(e))n||(d=function(){var e=[].slice.call(arguments);f.apply(this,e),p()}),a(e,d,t,0,s);else if(Object(e)===e)for(l in c=function(){var t,n=0;for(t in e)e.hasOwnProperty(t)&&n++;return n}(),e)e.hasOwnProperty(l)&&(!n&&!--c&&(r(d)?d=function(){var e=[].slice.call(arguments);f.apply(this,e),p()}:d[l]=function(e){return function(){var t=[].slice.call(arguments);e&&e.apply(this,t),p()}}(f[l])),a(e[l],d,t,l,s))}else!n&&p()}var c,l,s=!!e.test,u=e.load||e.both,d=e.callback||i,f=d,p=e.complete||i;n(s?e.yep:e.nope,!!u),u&&n(u)}var l,s,d=this.yepnope.loader;if(o(e))a(e,0,d,0);else if(w(e))for(l=0;l<e.length;l++)o(s=e[l])?a(s,0,d,0):w(s)?f(s):Object(s)===s&&c(s,d);else Object(e)===e&&c(e,d)}).addPrefix=function(e,t){x[e]=t},f.addFilter=function(e){N.push(e)},f.errorTimeout=1e4,null==t.readyState&&t.addEventListener&&(t.readyState="loading",t.addEventListener("DOMContentLoaded",d=function(){t.removeEventListener("DOMContentLoaded",d,0),t.readyState="complete"},0)),e.yepnope=u(),e.yepnope.executeStack=c,e.yepnope.injectJs=function(e,n,r,o,l,s){var u,d,p=t.createElement("script");o=o||f.errorTimeout;for(d in p.src=e,r)p.setAttribute(d,r[d]);n=s?c:n||i,p.onreadystatechange=p.onload=function(){!u&&a(p.readyState)&&(u=1,n(),p.onload=p.onreadystatechange=null)},h(function(){u||(u=1,n(1))},o),l?p.onload():m.parentNode.insertBefore(p,m)},e.yepnope.injectCss=function(e,n,r,o,a,l){var s;o=t.createElement("link"),n=l?c:n||i;for(s in o.href=e,o.rel="stylesheet",o.type="text/css",r)o.setAttribute(s,r[s]);a||(m.parentNode.insertBefore(o,m),h(n,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};