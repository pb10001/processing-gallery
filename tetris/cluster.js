function Cluster(root, offsets) {
    this.rotateType = 0;
    this.root = root;
    this.offsets = offsets;
    this.blocks = [];
    for(var key in offsets) {
        var offset = offsets[key];
        this.blocks.push(new Block(root.x + offset.x, root.y + offset.y));
    }
    this.allBlocks = function() {
        return [root, ...this.blocks];
    }
    this.fall = function() {
        this.root.fall();
        for(var key in this.blocks) {
            this.blocks[key].fall();
        }
    }
    this.moveLeft = function() {
        this.root.moveLeft();
        for(var key in this.blocks) {
            this.blocks[key].moveLeft();
        }

    }
    this.moveRight = function() {
        this.root.moveRight();
        for(var key in this.blocks) {
            this.blocks[key].moveRight();
        }
    }
    this.rotateLeft = function() {
        if(this.rotateType === 3) {
            this.rotateType = 0;
        } else {
            this.rotateType++;
        }
        this.rotate();
    }
    this.rotateRight = function() {
        if(this.rotateType === 0) {
            this.rotateType = 3;
        } else {
            this.rotateType--;
        }
        this.rotate();
    }
    this.rotate = function() {
        this.blocks = [];
        if(this.rotateType === 0) {
            for(var key in this.offsets) {
                var offset = this.offsets[key];
                this.blocks.push(new Block(this.root.x + offset.x, this.root.y + offset.y));
            }
        } else if(this.rotateType === 1) {
            for(var key in this.offsets) {
                var offset = this.offsets[key];
                this.blocks.push(new Block(this.root.x + offset.y, this.root.y - offset.x));
            }
        } else if(this.rotateType === 2) {
            for(var key in this.offsets) {
                var offset = this.offsets[key];
                this.blocks.push(new Block(this.root.x - offset.x, this.root.y - offset.y));
            }
        } else if(this.rotateType === 3) {
            for(var key in this.offsets) {
                var offset = this.offsets[key];
                this.blocks.push(new Block(this.root.x - offset.y, this.root.y + offset.x));
            }
        }
    }
    this.show = function() {
        this.root.show();
        for(var key in this.blocks) {
            this.blocks[key].show();
        }
    }
}