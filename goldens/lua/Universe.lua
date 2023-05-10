--[[ Universe

  Automatically generated by the FlatBuffers compiler, do not modify.
  Or modify. I'm a message, not a cop.

  flatc version: 23.5.9

  Declared by  : //basic.fbs
  Rooting type : Universe (//basic.fbs)

--]]

local __Galaxy = require('Galaxy')
local flatbuffers = require('flatbuffers')

local Universe = {}
local mt = {}

function Universe.New()
  local o = {}
  setmetatable(o, {__index = mt})
  return o
end

function Universe.GetRootAsUniverse(buf, offset)
  if type(buf) == "string" then
    buf = flatbuffers.binaryArray.New(buf)
  end

  local n = flatbuffers.N.UOffsetT:Unpack(buf, offset)
  local o = Universe.New()
  o:Init(buf, n + offset)
  return o
end

function mt:Init(buf, pos)
  self.view = flatbuffers.view.New(buf, pos)
end

function mt:Age()
  local o = self.view:Offset(4)
  if o ~= 0 then
    return self.view:Get(flatbuffers.N.Float64, self.view.pos + o)
  end
  return 0.0
end

function mt:Galaxies(j)
  local o = self.view:Offset(6)
  if o ~= 0 then
    local x = self.view:Vector(o)
    x = x + ((j-1) * 4)
    x = self.view:Indirect(x)
    local obj = __Galaxy.New()
    obj:Init(self.view.bytes, x)
    return obj
  end
end

function mt:GalaxiesLength()
  local o = self.view:Offset(6)
  if o ~= 0 then
    return self.view:VectorLen(o)
  end
  return 0
end

function Universe.Start(builder)
  builder:StartObject(2)
end

function Universe.AddAge(builder, age)
  builder:PrependFloat64Slot(0, age, 0.0)
end

function Universe.AddGalaxies(builder, galaxies)
  builder:PrependUOffsetTRelativeSlot(1, galaxies, 0)
end

function Universe.StartGalaxiesVector(builder, numElems)
  return builder:StartVector(4, numElems, 4)
end

function Universe.End(builder)
  return builder:EndObject()
end

return Universe