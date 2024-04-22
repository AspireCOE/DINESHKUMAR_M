var event = require('events');
var emitter=new event.EventEmitter();

emitter.on('trackDelivery',()=>{
    console.log("order out for delivery");
});

function deliveryStatus(){
    console.log("Please wait for the delivery status, we are loading");

    console.log("final Status");
    emitter.emit('trackDelivery');
};

deliveryStatus();