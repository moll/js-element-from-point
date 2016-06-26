ElementFromPoint.js
===================
[![NPM version][npm-badge]](http://badge.fury.io/js/element-from-point)

ElementFromPoint.js is a cross-browser [`document.elementFromPoint`][mdn]
function that works consistently across browsers that may implement
`document.elementFromPoint` differently.

For example, older iOS or Android devices (with WebKit) implement
`elementFromPoint` such that it takes page (`pageX/Y`) coordinates, not viewport
(`clientX/Y`) coordinates. Use this function to always work with viewport
coordinates.

### Further reading
- [document.elementFromPoint at MDN][mdn]
- [QuirksMode's W3C DOM Compatibility][w3c]
- [QuirksMode's Great WebKit Comparison Table][comparison]

[mdn]: https://developer.mozilla.org/en-US/docs/Web/API/document.elementFromPoint
[w3c]: http://www.quirksmode.org/dom/w3c_cssom.html#t20
[comparison]: http://www.quirksmode.org/webkit.html#t08
[npm-badge]: https://badge.fury.io/js/element-from-point.png


Installing
----------
### Installing on Node.js
```sh
npm install element-from-point
```


Using
-----
Require and use it as you would use `document.elementFromPoint`.  
Just make sure to pass in viewport coordinates and you're all set.

```javascript
var elementFromPoint = require("element-from-point")
document.addEventListener("mousedown", function(ev) {
  var el = elementFromPoint(ev.clientX, ev.clientY)
})
```

License
-------
ElementFromPoint.js is released under a *Lesser GNU Affero General Public
License*, which in summary means:

- You **can** use this program for **no cost**.
- You **can** use this program for **both personal and commercial reasons**.
- You **do not have to share your own program's code** which uses this program.
- You **have to share modifications** (e.g bug-fixes) you've made to this
  program.

For more convoluted language, see the `LICENSE` file.


About
-----
**[Andri Möll](http://themoll.com)** typed this and the code.  
[Monday Calendar](https://mondayapp.com) supported the engineering work.

If you find ElementFromPoint.js needs improving, ping me at
[andri@dot.ee][email] or [create an issue online][issues].

[email]: mailto:andri@dot.ee
[issues]: https://github.com/moll/js-element-from-point/issues
