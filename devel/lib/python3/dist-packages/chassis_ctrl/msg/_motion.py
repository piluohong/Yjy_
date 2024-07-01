# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from chassis_ctrl/motion.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class motion(genpy.Message):
  _md5sum = "523376a3a3e7158b7be3bb165bd17ef2"
  _type = "chassis_ctrl/motion"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# 坐标(x,y,z,theta_z)，4行1列
float32[] data
int32 rows=4
int32 cols=1

# xyz动作执行量
float32 dist_x # unit: mm
float32 dist_y
float32 dist_z

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
"""
  # Pseudo-constants
  rows = 4
  cols = 1

  __slots__ = ['data','dist_x','dist_y','dist_z','dir_x','dir_y','dir_z','b_x','b_y','b_z','b_cybergear','action_f']
  _slot_types = ['float32[]','float32','float32','float32','int32','int32','int32','bool','bool','bool','bool','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       data,dist_x,dist_y,dist_z,dir_x,dir_y,dir_z,b_x,b_y,b_z,b_cybergear,action_f

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(motion, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.data is None:
        self.data = []
      if self.dist_x is None:
        self.dist_x = 0.
      if self.dist_y is None:
        self.dist_y = 0.
      if self.dist_z is None:
        self.dist_z = 0.
      if self.dir_x is None:
        self.dir_x = 0
      if self.dir_y is None:
        self.dir_y = 0
      if self.dir_z is None:
        self.dir_z = 0
      if self.b_x is None:
        self.b_x = False
      if self.b_y is None:
        self.b_y = False
      if self.b_z is None:
        self.b_z = False
      if self.b_cybergear is None:
        self.b_cybergear = False
      if self.action_f is None:
        self.action_f = False
    else:
      self.data = []
      self.dist_x = 0.
      self.dist_y = 0.
      self.dist_z = 0.
      self.dir_x = 0
      self.dir_y = 0
      self.dir_z = 0
      self.b_x = False
      self.b_y = False
      self.b_z = False
      self.b_cybergear = False
      self.action_f = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.data)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.data))
      _x = self
      buff.write(_get_struct_3f3i5B().pack(_x.dist_x, _x.dist_y, _x.dist_z, _x.dir_x, _x.dir_y, _x.dir_z, _x.b_x, _x.b_y, _x.b_z, _x.b_cybergear, _x.action_f))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.data = s.unpack(str[start:end])
      _x = self
      start = end
      end += 29
      (_x.dist_x, _x.dist_y, _x.dist_z, _x.dir_x, _x.dir_y, _x.dir_z, _x.b_x, _x.b_y, _x.b_z, _x.b_cybergear, _x.action_f,) = _get_struct_3f3i5B().unpack(str[start:end])
      self.b_x = bool(self.b_x)
      self.b_y = bool(self.b_y)
      self.b_z = bool(self.b_z)
      self.b_cybergear = bool(self.b_cybergear)
      self.action_f = bool(self.action_f)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.data)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.data.tostring())
      _x = self
      buff.write(_get_struct_3f3i5B().pack(_x.dist_x, _x.dist_y, _x.dist_z, _x.dir_x, _x.dir_y, _x.dir_z, _x.b_x, _x.b_y, _x.b_z, _x.b_cybergear, _x.action_f))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.data = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      _x = self
      start = end
      end += 29
      (_x.dist_x, _x.dist_y, _x.dist_z, _x.dir_x, _x.dir_y, _x.dir_z, _x.b_x, _x.b_y, _x.b_z, _x.b_cybergear, _x.action_f,) = _get_struct_3f3i5B().unpack(str[start:end])
      self.b_x = bool(self.b_x)
      self.b_y = bool(self.b_y)
      self.b_z = bool(self.b_z)
      self.b_cybergear = bool(self.b_cybergear)
      self.action_f = bool(self.action_f)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3f3i5B = None
def _get_struct_3f3i5B():
    global _struct_3f3i5B
    if _struct_3f3i5B is None:
        _struct_3f3i5B = struct.Struct("<3f3i5B")
    return _struct_3f3i5B
