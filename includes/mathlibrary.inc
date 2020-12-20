#if defined _mathlibrary_included_
	#endinput
#endif
#define _mathlibrary_included_

enum Vector3
{
	Float:X,
	Float:Y,
	Float:Z
};

enum Quaternion
{
	Float:W,
	Float:X,
	Float:Y,
	Float:Z
};

enum Matrix3
{
	data[9]
};

//forward InitVector(Float:x, Float:y, Float:z);
//forward GetObjectPosVector3(objid, &vector[Vector3]);

stock Quaternion_Init(Float:x, Float:y, Float:z, Float:w)
{
	new q[Quaternion];
	q[X] = x;
	q[Y] = y;
	q[Z] = z;
	q[W] = w;
	return q;
}
stock Quaternion_InitVec3(const v[Vector3], Float:w)
{
	new q[Quaternion];
	q[X] = v[X];
	q[Y] = v[Y];
	q[Z] = v[Z];
	q[W] = w;
	return q;
}
stock Quaternion_Inverse(const quat[Quaternion])
{
	new q[Quaternion];
	q[X] = -1 * quat[X];
	q[Y] = -1 * quat[Y];
	q[Z] = -1 * quat[Z];
	q[W] = quat[W];
	return q;
}
stock Quaternion_Multiply(const q0[Quaternion],const q1[Quaternion])
{
	new quat[Quaternion];
	quat[X] = ((q0[W] * q1[X]) + (q0[X] * q1[W]) + (q0[Y] * q1[Z]) - (q0[Z] * q1[Y]));
	quat[Y] = ((q0[W] * q1[Y]) + (q0[X] * q1[W]) - (q0[Y] * q1[Z]) + (q0[Z] * q1[X]));
	quat[Z] = ((q0[W] * q1[Z]) + (q0[X] * q1[W]) + (q0[Y] * q1[Y]) - (q0[Z] * q1[X]));
	quat[W] = ((q0[W] * q1[W]) - (q0[X] * q1[X]) - (q0[Y] * q1[Y]) - (q0[Z] * q1[Z]));
	return quat;
}
stock Quaternion_ToVector3(const q[Quaternion])
{
	new v[Vector3];
	v[X] = q[X];
	v[Y] = q[Y];
	v[Z] = q[Z];
	return v;
}
stock Quaternion_Print(const q[Quaternion])
{
	printf("{ %f, %f, %f, %f }", q[X], q[Y], q[Z], q[W]);
}
stock Vector_Init(Float:x, Float:y, Float:z)
{
	new v[Vector3];
	v[X] = x;
	v[Y] = y;
	v[Z] = z;
	return v;
}
stock Vector_Add(const v0[Vector3], const v1[Vector3])
{
	new vresult[Vector3];
	vresult[X] = v0[X] + v1[X];
	vresult[Y] = v0[Y] + v1[Y];
	vresult[Z] = v0[Z] + v1[Z];
	return vresult;
}
stock Vector_Sub(const v0[Vector3], const v1[Vector3])
{
	new vresult[Vector3];
	vresult[X] = v0[X] - v1[X];
	vresult[Y] = v0[Y] - v1[Y];
	vresult[Z] = v0[Z] - v1[Z];
	return vresult;
}
stock Vector_Multiply(const v0[Vector3],Float:scalar)
{
	new vresult[Vector3];
	vresult[X] = v0[X] * scalar;
	vresult[Y] = v0[Y] * scalar;
	vresult[Z] = v0[Z] * scalar;
	return vresult;
}
stock Vector_Cross(const v0[Vector3], const v1[Vector3])
{
	new vresult[Vector3];
	vresult[X] = 	  (v0[Y] * v1[Z] - v0[Z] * v1[Y]);
	vresult[Y] = -1 * (v0[X] * v1[Z] - v0[Z] * v1[X]);
	vresult[Z] =      (v0[X] * v1[Y] - v0[Y] * v1[X]);
	return vresult;
}
stock Float:Vector_Dot(const v0[Vector3], const v1[Vector3])
{
	return (v0[X] * v1[X] + v0[Y] * v1[Y] + v0[Z] * v1[Z]);
}
stock GetVecDistAngle(const v[Vector3], Float:distance, Float:angle)
{
	new r[Vector3];
	r[X] = v[X] + distance * floatcos(angle, degrees);
	r[Y] = v[Y] + distance * floatsin(angle, degrees);
	r[Z] = v[Z];
	return r;
}
stock Vector_Print(v[Vector3])
{
	printf("{ Vector: %f, %f, %f }", v[X], v[Y], v[Z]);
}

stock GetObjectPosVector3(objid)
{
	new v[Vector3];
	GetObjectPos(objid, v[X], v[Y], v[Z]);
	return v;
}
stock GetPlayerPosVector3(playerid)
{
	new v[Vector3];
	GetPlayerPos(playerid, v[X], v[Y], v[Z]);
	return v;
}

stock Vector_SCM(playerid,const v[Vector3])
{
	new str[256];
	format(str,sizeof(str),"Vector: ( %f, %f, %f )",v[X], v[Y], v[Z]);
	SendClientMessage(playerid, -1, str);
}
stock Quaternion_SCM(playerid,const q[Quaternion])
{
	new str[256];
	format(str,sizeof(str),"Quaternion: ( %f, %f, %f, %f)",q[X], q[Y], q[Z], q[W]);
	SendClientMessage(playerid, -1, str);
}
