$(".show-more a").on("click", function() {
    var $this = $(this);
    var $content = $this.parent().prev("div.content");
    var linkText = $this.text().toUpperCase();

    if(linkText === "MORE"){
        linkText = "less";
        $content.switchClass("hideContent", "showContent", 400);
    } else {
        linkText = "more";
        $content.switchClass("showContent", "hideContent", 400);
    };

    $this.text(linkText);
});
