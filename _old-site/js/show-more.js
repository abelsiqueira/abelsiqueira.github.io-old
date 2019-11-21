$(".show-more a").on("click", function() {
    var $this = $(this);
    var $content = $this.parent().prev("div.content");
    var linkText = $this.text().toUpperCase();
		var speed = 1000;

    if(linkText === "MORE"){
        linkText = "less";
        $content.switchClass("hideContent", "showContent", speed);
    } else {
        linkText = "more";
        $content.switchClass("showContent", "hideContent", speed);
    };

    $this.text(linkText);
});
