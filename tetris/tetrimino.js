var tetrimino = function() {
    this.offsetList = [
        {
            /* Reverse L-shape */
            name: "",
            center: {},
            offsets: [
              {x: 0, y: - BLOCK_UNIT},
              {x: 0, y: BLOCK_UNIT},
              {x: - BLOCK_UNIT, y: BLOCK_UNIT}
            ]
        },
        {
            /* L-shape */
            name: "",
            center: {},
            offsets: [
            {x: 0, y: - BLOCK_UNIT},
            {x: 0, y: BLOCK_UNIT},
            {x: BLOCK_UNIT, y: BLOCK_UNIT}
            ]
        },
        {
            /* T-shape */
            name: "",
            center: {},
            offsets:[
                {x: 0, y: - BLOCK_UNIT},
                {x: BLOCK_UNIT, y: 0},
                {x: - BLOCK_UNIT, y: 0}
            ]
        },
        {
            /* Square */
            name: "",
            center: {},
            offsets: [
              {x: 0, y: + BLOCK_UNIT},
              {x: BLOCK_UNIT, y: 0},
              {x: BLOCK_UNIT, y: BLOCK_UNIT}
            ]
        },
        {
            /* Z-shape */
            name: "",
            center: {},
            offsets:[
                {x: 0, y: - BLOCK_UNIT},
                {x: - BLOCK_UNIT, y: -BLOCK_UNIT},
                {x:  BLOCK_UNIT, y: 0}    
              ]
        },
        {
            /* Reverse Z-shape */
            name: "",
            center: {},
            offsets: [
                {x: 0, y: - BLOCK_UNIT},
                {x: BLOCK_UNIT, y: -BLOCK_UNIT},
                {x: - BLOCK_UNIT, y: 0}    
            ]
        },
        {
            /* I-shape */
            name: "",
            center: {},
            offsets:[
                {x: 0, y: - BLOCK_UNIT},
                {x: 0, y: BLOCK_UNIT},
                {x: 0, y: 2 * BLOCK_UNIT}    
            ]
        }
    ]
    this.pickOffset = function() {
        var num = Math.floor(random(this.offsetList.length));
        return this.offsetList[num];
    }
}