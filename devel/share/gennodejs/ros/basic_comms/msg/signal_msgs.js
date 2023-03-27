// Auto-generated. Do not edit!

// (in-package basic_comms.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class signal_msgs {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.time_x = null;
      this.signal_y = null;
    }
    else {
      if (initObj.hasOwnProperty('time_x')) {
        this.time_x = initObj.time_x
      }
      else {
        this.time_x = 0.0;
      }
      if (initObj.hasOwnProperty('signal_y')) {
        this.signal_y = initObj.signal_y
      }
      else {
        this.signal_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type signal_msgs
    // Serialize message field [time_x]
    bufferOffset = _serializer.float64(obj.time_x, buffer, bufferOffset);
    // Serialize message field [signal_y]
    bufferOffset = _serializer.float32(obj.signal_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type signal_msgs
    let len;
    let data = new signal_msgs(null);
    // Deserialize message field [time_x]
    data.time_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [signal_y]
    data.signal_y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'basic_comms/signal_msgs';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '00f39935c5dcc9cf05628912678eba28';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 time_x
    float32 signal_y
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new signal_msgs(null);
    if (msg.time_x !== undefined) {
      resolved.time_x = msg.time_x;
    }
    else {
      resolved.time_x = 0.0
    }

    if (msg.signal_y !== undefined) {
      resolved.signal_y = msg.signal_y;
    }
    else {
      resolved.signal_y = 0.0
    }

    return resolved;
    }
};

module.exports = signal_msgs;
