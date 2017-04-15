{% if theme.weibo.enable  and theme.weibo.appkey %}

<script type="text/javascript">
(function(){
var appkey = '{{theme.weibo.appkey}}';
var url = "http://widget.weibo.com/distribution/comments.php?width=0&url=auto&skin=3&appkey="+appkey+"&iframskin=3&dpc=1";
url = url.replace("url=auto", "url=" + encodeURIComponent(document.URL)); 
document.write('<iframe id="WBCommentFrame" src="' + url + '" scrolling="no" frameborder="0" style="width:100%"></iframe>');
})();
</script>
<script src="http://tjs.sjs.sinajs.cn/open/widget/js/widget/comment.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

{% endif %}

