function Cluster() {
    this.blocks = blocks;
    this.fall = function() {

    }
    this.rotateLeft = function() {

    }
    this.rotateRight = function() {

    }
    this.show = function() {
        for(var key in this.blocks) {
            blocks[key].show();
        }
    }
}