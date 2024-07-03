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
      this.p_index = null;
      this.v_x = null;
      this.v_y = null;
      this.v_z = null;
      this.d_x = null;
      this.d_y = null;
      this.d_z = null;
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
        this.data = new Array(8).fill(0);
      }
      if (initObj.hasOwnProperty('p_index')) {
        this.p_index = initObj.p_index
      }
      else {
        this.p_index = 0;
      }
      if (initObj.hasOwnProperty('v_x')) {
        this.v_x = initObj.v_x
      }
      else {
        this.v_x = 0.0;
      }
      if (initObj.hasOwnProperty('v_y')) {
        this.v_y = initObj.v_y
      }
      else {
        this.v_y = 0.0;
      }
      if (initObj.hasOwnProperty('v_z')) {
        this.v_z = initObj.v_z
      }
      else {
        this.v_z = 0.0;
      }
      if (initObj.hasOwnProperty('d_x')) {
        this.d_x = initObj.d_x
      }
      else {
        this.d_x = 0.0;
      }
      if (initObj.hasOwnProperty('d_y')) {
        this.d_y = initObj.d_y
      }
      else {
        this.d_y = 0.0;
      }
      if (initObj.hasOwnProperty('d_z')) {
        this.d_z = initObj.d_z
      }
      else {
        this.d_z = 0.0;
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
    // Check that the constant length array field [data] has the right length
    if (obj.data.length !== 8) {
      throw new Error('Unable to serialize array field data - length must be 8')
    }
    // Serialize message field [data]
    bufferOffset = _arraySerializer.float32(obj.data, buffer, bufferOffset, 8);
    // Serialize message field [p_index]
    bufferOffset = _serializer.int32(obj.p_index, buffer, bufferOffset);
    // Serialize message field [v_x]
    bufferOffset = _serializer.float32(obj.v_x, buffer, bufferOffset);
    // Serialize message field [v_y]
    bufferOffset = _serializer.float32(obj.v_y, buffer, bufferOffset);
    // Serialize message field [v_z]
    bufferOffset = _serializer.float32(obj.v_z, buffer, bufferOffset);
    // Serialize message field [d_x]
    bufferOffset = _serializer.float32(obj.d_x, buffer, bufferOffset);
    // Serialize message field [d_y]
    bufferOffset = _serializer.float32(obj.d_y, buffer, bufferOffset);
    // Serialize message field [d_z]
    bufferOffset = _serializer.float32(obj.d_z, buffer, bufferOffset);
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
    data.data = _arrayDeserializer.float32(buffer, bufferOffset, 8)
    // Deserialize message field [p_index]
    data.p_index = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [v_x]
    data.v_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v_y]
    data.v_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v_z]
    data.v_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [d_x]
    data.d_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [d_y]
    data.d_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [d_z]
    data.d_z = _deserializer.float32(buffer, bufferOffset);
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
    return 89;
  }

  static datatype() {
    // Returns string type for a message object
    return 'chassis_ctrl/motion';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '09cf865b2244b478628aef6da36bc73b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # (x,y,z,theta_z;....;....;)， 坐标值/z轴目标角度 （测试使用两个点）
    float32[8] data  # mm
    
    # 当前点索引
    int32 p_index
    
    # 定位每个目标时，三个方向的速度值, 根据电机给定
    float32 v_x
    float32 v_y
    float32 v_z
    
    # xyz执行量
    float32 d_x
    float32 d_y
    float32 d_z
    
    # xyz 执行时间, 用于响应截止
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
      resolved.data = new Array(8).fill(0)
    }

    if (msg.p_index !== undefined) {
      resolved.p_index = msg.p_index;
    }
    else {
      resolved.p_index = 0
    }

    if (msg.v_x !== undefined) {
      resolved.v_x = msg.v_x;
    }
    else {
      resolved.v_x = 0.0
    }

    if (msg.v_y !== undefined) {
      resolved.v_y = msg.v_y;
    }
    else {
      resolved.v_y = 0.0
    }

    if (msg.v_z !== undefined) {
      resolved.v_z = msg.v_z;
    }
    else {
      resolved.v_z = 0.0
    }

    if (msg.d_x !== undefined) {
      resolved.d_x = msg.d_x;
    }
    else {
      resolved.d_x = 0.0
    }

    if (msg.d_y !== undefined) {
      resolved.d_y = msg.d_y;
    }
    else {
      resolved.d_y = 0.0
    }

    if (msg.d_z !== undefined) {
      resolved.d_z = msg.d_z;
    }
    else {
      resolved.d_z = 0.0
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

module.exports = motion;
