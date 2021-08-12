var MonthView,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

MonthView = (function() {
  function MonthView() {
    this.setActive = bind(this.setActive, this);
    console.log('MonthView.new()');
    this.monthViewElement = document.getElementById('MonthList');
    this.PostIndex = document.getElementById('PostIndex');
    if (this.PostIndex !== void 0) {
      this.bindPostIndexScroll();
    }
  }

  MonthView.prototype.bindPostIndexScroll = function() {
    return document.addEventListener('scroll', (function(_this) {
      return function(e) {
        return _this.linkFor(_this.monthFor(window.pageYOffset));
      };
    })(this));
  };

  MonthView.prototype.monthFor = function(position) {
    var month, section, sections;
    sections = this.PostIndex.getElementsByTagName('section');
    month = ((function() {
      var i, len, results;
      results = [];
      for (i = 0, len = sections.length; i < len; i++) {
        section = sections[i];
        if ((section.offsetTop + section.offsetHeight) >= position) {
          results.push(section.id);
        }
      }
      return results;
    })())[0];
    return month;
  };

  MonthView.prototype.linkFor = function(month) {
    var a, link, links;
    this.removeActive();
    links = this.monthViewElement.getElementsByTagName('a');
    link = ((function() {
      var i, len, results;
      results = [];
      for (i = 0, len = links.length; i < len; i++) {
        a = links[i];
        if (a.href.split('#')[1] === month) {
          results.push(a);
        }
      }
      return results;
    })())[0];
    return this.setActive(link.children[0]);
  };

  MonthView.prototype.bindClick = function() {
    var i, len, link, links, results;
    links = this.monthViewElement.getElementsByTagName('a');
    results = [];
    for (i = 0, len = links.length; i < len; i++) {
      link = links[i];
      results.push((function(_this) {
        return function() {
          link.addEventListener('click', function(event) {
            return _this.setActive(event.target);
          });
        };
      })(this)());
    }
    return results;
  };

  MonthView.prototype.setActive = function(item) {
    this.removeActive();
    return item.classList.add('active');
  };

  MonthView.prototype.removeActive = function() {
    var i, len, li, lis, results;
    lis = this.monthViewElement.getElementsByTagName('li');
    results = [];
    for (i = 0, len = lis.length; i < len; i++) {
      li = lis[i];
      results.push((function() {
        li.classList.remove('active');
      })());
    }
    return results;
  };

  return MonthView;

})();

if (window.monthView === void 0) {
  window.monthView = new MonthView;
}
