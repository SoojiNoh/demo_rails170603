!function(e){e.fn.extend({slimScroll:function(n){var i=e.extend({width:"auto",height:"250px",size:"7px",color:"#000",position:"right",distance:"1px",start:"top",opacity:.4,alwaysVisible:!1,disableFadeOut:!1,railVisible:!1,railColor:"#333",railOpacity:.2,railDraggable:!0,railClass:"slimScrollRail",barClass:"slimScrollBar",wrapperClass:"slimScrollDiv",allowPageScroll:!1,wheelStep:20,touchScrollStep:200,borderRadius:"7px",railBorderRadius:"7px"},n);return this.each(function(){function o(t){if(u){t=t||window.event;var n=0;t.wheelDelta&&(n=-t.wheelDelta/120),t.detail&&(n=t.detail/3),e(t.target||t.srcTarget||t.srcElement).closest("."+i.wrapperClass).is(y.parent())&&r(n,!0),t.preventDefault&&!v&&t.preventDefault(),v||(t.returnValue=!1)}}function r(t,e,n){v=!1;var o=t,r=y.outerHeight()-x.outerHeight();e&&(o=parseInt(x.css("top"))+t*parseInt(i.wheelStep)/100*x.outerHeight(),o=Math.min(Math.max(o,0),r),o=0<t?Math.ceil(o):Math.floor(o),x.css({top:o+"px"})),g=parseInt(x.css("top"))/(y.outerHeight()-x.outerHeight()),o=g*(y[0].scrollHeight-y.outerHeight()),n&&(o=t,t=o/y[0].scrollHeight*y.outerHeight(),t=Math.min(Math.max(t,0),r),x.css({top:t+"px"})),y.scrollTop(o),y.trigger("slimscrolling",~~o),a(),l()}function s(){h=Math.max(y.outerHeight()/y[0].scrollHeight*y.outerHeight(),30),x.css({height:h+"px"});var t=h==y.outerHeight()?"none":"block";x.css({display:t})}function a(){s(),clearTimeout(p),g==~~g?(v=i.allowPageScroll,m!=g&&y.trigger("slimscroll",0==~~g?"top":"bottom")):v=!1,m=g,h>=y.outerHeight()?v=!0:(x.stop(!0,!0).fadeIn("fast"),i.railVisible&&w.stop(!0,!0).fadeIn("fast"))}function l(){i.alwaysVisible||(p=setTimeout(function(){i.disableFadeOut&&u||c||d||(x.fadeOut("slow"),w.fadeOut("slow"))},1e3))}var u,c,d,p,f,h,g,m,v=!1,y=e(this);if(y.parent().hasClass(i.wrapperClass)){var b=y.scrollTop(),x=y.closest("."+i.barClass),w=y.closest("."+i.railClass);if(s(),e.isPlainObject(n)){if("height"in n&&"auto"==n.height){y.parent().css("height","auto"),y.css("height","auto");var T=y.parent().parent().height();y.parent().css("height",T),y.css("height",T)}if("scrollTo"in n)b=parseInt(i.scrollTo);else if("scrollBy"in n)b+=parseInt(i.scrollBy);else if("destroy"in n)return x.remove(),w.remove(),void y.unwrap();r(b,!1,!0)}}else if(!(e.isPlainObject(n)&&"destroy"in n)){i.height="auto"==i.height?y.parent().height():i.height,b=e("<div></div>").addClass(i.wrapperClass).css({position:"relative",overflow:"hidden",width:i.width,height:i.height}),y.css({overflow:"hidden",width:i.width,height:i.height});var w=e("<div></div>").addClass(i.railClass).css({width:i.size,height:"100%",position:"absolute",top:0,display:i.alwaysVisible&&i.railVisible?"block":"none","border-radius":i.railBorderRadius,background:i.railColor,opacity:i.railOpacity,zIndex:90}),x=e("<div></div>").addClass(i.barClass).css({background:i.color,width:i.size,position:"absolute",top:0,opacity:i.opacity,display:i.alwaysVisible?"block":"none","border-radius":i.borderRadius,BorderRadius:i.borderRadius,MozBorderRadius:i.borderRadius,WebkitBorderRadius:i.borderRadius,zIndex:99}),T="right"==i.position?{right:i.distance}:{left:i.distance};w.css(T),x.css(T),y.wrap(b),y.parent().append(x),y.parent().append(w),i.railDraggable&&x.bind("mousedown",function(n){var i=e(document);return d=!0,t=parseFloat(x.css("top")),pageY=n.pageY,i.bind("mousemove.slimscroll",function(e){currTop=t+e.pageY-pageY,x.css("top",currTop),r(0,x.position().top,!1)}),i.bind("mouseup.slimscroll",function(){d=!1,l(),i.unbind(".slimscroll")}),!1}).bind("selectstart.slimscroll",function(t){return t.stopPropagation(),t.preventDefault(),!1}),w.hover(function(){a()},function(){l()}),x.hover(function(){c=!0},function(){c=!1}),y.hover(function(){u=!0,a(),l()},function(){u=!1,l()}),y.bind("touchstart",function(t){t.originalEvent.touches.length&&(f=t.originalEvent.touches[0].pageY)}),y.bind("touchmove",function(t){v||t.originalEvent.preventDefault(),t.originalEvent.touches.length&&(r((f-t.originalEvent.touches[0].pageY)/i.touchScrollStep,!0),f=t.originalEvent.touches[0].pageY)}),s(),"bottom"===i.start?(x.css({top:y.outerHeight()-x.outerHeight()}),r(0,!0)):"top"!==i.start&&(r(e(i.start).position().top,null,!0),i.alwaysVisible||x.hide()),window.addEventListener?(this.addEventListener("DOMMouseScroll",o,!1),this.addEventListener("mousewheel",o,!1)):document.attachEvent("onmousewheel",o)}}),this}}),e.fn.extend({slimscroll:e.fn.slimScroll})}(jQuery);