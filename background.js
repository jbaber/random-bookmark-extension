/* Fill `accumulator` with a flat list of all bookmarks */
function accumulate_bookmarks(tree, accumulator) {
  if (tree.url) {
    accumulator.push(tree);
  }
  if (tree.children) {
    for (child of tree.children) {
      accumulate_bookmarks(child, accumulator);
    }
  }
}


if (typeof browser !== "undefined") {

  function get_bookmarks_with_caching(tree) {
    var all_bookmarks = [];
    accumulate_bookmarks(tree, all_bookmarks);
    return all_bookmarks;
  }



  /* Listen for via toolbar button (firefox) */
  if (typeof browser.browserAction !== "undefined") {
    browser.browserAction.onClicked.addListener(function() {
      function on_rejected(err) {
        console.log(`An error: ${err}`);
      }

      browser.bookmarks.getTree().then(function(x) {
        var tree = x[0];
        var all_bookmarks = get_bookmarks_with_caching(tree);
        var num_bookmarks = all_bookmarks.length;
        var random_bookmark_index = Math.floor(Math.random() * num_bookmarks);
        browser.tabs.update({url: all_bookmarks[random_bookmark_index].url});
      }, on_rejected);
    });
  }
}
