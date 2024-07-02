// Auto-generated. Do not edit!

// (in-package chassis_ctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class motion {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
      this.t_x = null;
      this.t_y = null;
      this.t_z = null;
      this.dir_x = null;
      this.dir_y = null;
      this.dir_z = null;
      this.b_x = null;
      this.b_y = null;
      this.b_z = null;
      this.b_cybergear = null;
      this.action_f = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('t_x')) {
        this.t_x = initObj.t_x
      }
      else {
        this.t_x = 0.0;
      }
      if (initObj.hasOwnProperty('t_y')) {
        this.t_y = initObj.t_y
      }
      else {
        this.t_y = 0.0;
      }
      if (initObj.hasOwnProperty('t_z')) {
        this.t_z = initObj.t_z
      }
      else {
        this.t_z = 0.0;
      }
      if (initObj.hasOwnProperty('dir_x')) {
        this.dir_x = initObj.dir_x
      }
      else {
        this.dir_x = 0;
      }
      if (initObj.hasOwnProperty('dir_y')) {
        this.dir_y = initObj.dir_y
      }
      else {
        this.dir_y = 0;
      }
      if (initObj.hasOwnProperty('dir_z')) {
        this.dir_z = initObj.dir_z
      }
      else {
        this.dir_z = 0;
      }
      if (initObj.hasOwnProperty('b_x')) {
        this.b_x = initObj.b_x
      }
      else {
        this.b_x = false;
      }
      if (initObj.hasOwnProperty('b_y')) {
        this.b_y = initObj.b_y
      }
      else {
        this.b_y = false;
      }
      if (initObj.hasOwnProperty('b_z')) {
        this.b_z = initObj.b_z
      }
      else {
        this.b_z = false;
      }
      if (initObj.hasOwnProperty('b_cybergear')) {
        this.b_cybergear = initObj.b_cybergear
      }
      else {
        this.b_cybergear = false;
      }
      if (initObj.hasOwnProperty('action_f')) {
        this.action_f = initObj.action_f
      }
      else {
        this.action_f = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motion
    // Serialize message field [data]
    bufferOffset = _arraySerializer.float32(obj.data, buffer, bufferOffset, null);
    // Serialize message field [t_x]
    bufferOffset = _serializer.float32(obj.t_x, buffer, bufferOffset);
    // Serialize message field [t_y]
    bufferOffset = _serializer.float32(obj.t_y, buffer, bufferOffset);
    // Serialize message field [t_z]
    bufferOffset = _serializer.float32(obj.t_z, buffer, bufferOffset);
    // Serialize message field [dir_x]
    bufferOffset = _serializer.int32(obj.dir_x, buffer, bufferOffset);
    // Serialize message field [dir_y]
    bufferOffset = _serializer.int32(obj.dir_y, buffer, bufferOffset);
    // Serialize message field [dir_z]
    bufferOffset = _serializer.int32(obj.dir_z, buffer, bufferOffset);
    // Serialize message field [b_x]
    bufferOffset = _serializer.bool(obj.b_x, buffer, bufferOffset);
    // Serialize message field [b_y]
    bufferOffset = _serializer.bool(obj.b_y, buffer, bufferOffset);
    // Serialize message field [b_z]
    bufferOffset = _serializer.bool(obj.b_z, buffer, bufferOffset);
    // Serialize message field [b_cybergear]
    bufferOffset = _serializer.bool(obj.b_cybergear, buffer, bufferOffset);
    // Serialize message field [action_f]
    bufferOffset = _serializer.bool(obj.action_f, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motion
    let len;
    let data = new motion(null);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [t_x]
    data.t_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [t_y]
    data.t_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [t_z]
    data.t_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dir_x]
    data.dir_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dir_y]
    data.dir_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dir_z]
    data.dir_z = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [b_x]
    data.b_x = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [b_y]
    data.b_y = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [b_z]
    data.b_z = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [b_cybergear]
    data.b_cybergear = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [action_f]
    data.action_f = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.data.length;
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'chassis_ctrl/motion';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0f753ed444269f6cdb194965ccef5c6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # (v_x,v_y,v_z,theta_z)，4行1列 速度值/z轴目标角度
    float32[] data  # mm / s
    int32 rows = 4
    int32 cols = 1
    
    # xyz 执行时间
    float32 t_x # unit: s
    float32 t_y
    float32 t_z
    
    # xyz动作执行方向
    int32 dir_x
    int32 dir_y
    int32 dir_z
    
    # 判断xyz,b_cybergear动作执行完成
    bool b_x
    bool b_y
    bool b_z
    bool b_cybergear
    
    # 判断钢筋绑扎完成
    bool action_f
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motion(null);
    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    if (msg.t_x !== undefined) {
      resolved.t_x = msg.t_x;
    }
    else {
      resolved.t_x = 0.0
    }

    if (msg.t_y !== undefined) {
      resolved.t_y = msg.t_y;
    }
    else {
      resolved.t_y = 0.0
    }

    if (msg.t_z !== undefined) {
      resolved.t_z = msg.t_z;
    }
    else {
      resolved.t_z = 0.0
    }

    if (msg.dir_x !== undefined) {
      resolved.dir_x = msg.dir_x;
    }
    else {
      resolved.dir_x = 0
    }

    if (msg.dir_y !== undefined) {
      resolved.dir_y = msg.dir_y;
    }
    else {
      resolved.dir_y = 0
    }

    if (msg.dir_z !== undefined) {
      resolved.dir_z = msg.dir_z;
    }
    else {
      resolved.dir_z = 0
    }

    if (msg.b_x !== undefined) {
      resolved.b_x = msg.b_x;
    }
    else {
      resolved.b_x = false
    }

    if (msg.b_y !== undefined) {
      resolved.b_y = msg.b_y;
    }
    else {
      resolved.b_y = false
    }

    if (msg.b_z !== undefined) {
      resolved.b_z = msg.b_z;
    }
    else {
      resolved.b_z = false
    }

    if (msg.b_cybergear !== undefined) {
      resolved.b_cybergear = msg.b_cybergear;
    }
    else {
      resolved.b_cybergear = false
    }

    if (msg.action_f !== undefined) {
      resolved.action_f = msg.action_f;
    }
    else {
      resolved.action_f = false
    }

    return resolved;
    }
};

// Constants for message
motion.Constants = {
  ROWS: 4,
  COLS: 1,
}

module.exports = motion;
