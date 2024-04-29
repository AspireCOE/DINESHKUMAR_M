const EventEmitter = require('events');

// Create a new EventEmitter instance
const myEmitter = new EventEmitter();

// Define an event handler function
const eventHandler = () => {
    console.log('An event occurred!');
};

// Attach the event handler to the 'myEvent' event
myEmitter.on('myEvent', eventHandler);

// Emit the 'myEvent' event
myEmitter.emit('myEvent');
