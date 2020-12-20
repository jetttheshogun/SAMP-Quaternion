#include <a_samp>
#include <ZCMD>
#include <sscanf2>
#include <mathlibrary>



#define             MAKE_COLOR(%0,%1,%2,%3)             (%0 << 24) | (%1 << 16) | (%2 << 8) | (%3)
#define             OBJECT_CENTER       	2114
#define            	OBJECT_OTHER        	1946
#define             O(%0)       OBJECT_%0

#define             MAX_OBJECTS_PER_PLAYER              50

enum ObjectData
{
	bool:IsCenter,
	oID
}
new ObjData[MAX_PLAYERS][MAX_OBJECTS_PER_PLAYER][ObjectData];

enum PlayerData
{
	bool:MapEdit,
	TotalObjects,
	Timer
}
new pData[MAX_PLAYERS][PlayerData];

public OnFilterScriptInit()
{
	new vec1[Vector3];
	new vec2[Vector3];
	new vec3[Vector3];
	vec1 = Vector_Init(1.0, 0.0, 0.0);
	vec2 = Vector_Init(0.0, 1.0, 0.0);
	vec3 = Vector_Cross(vec1, vec2);
	Vector_Print(vec3);
	return 1;
}
public OnFilterScriptExit()
{
	for(new i = 0; i < MAX_PLAYERS; i++) {
	    if(IsPlayerConnected(i)) {
	        for(new j = 0; j < pData[i][TotalObjects]; j++) {
	            if(IsValidObject(ObjData[i][j][oID])) {
	                DestroyObject(ObjData[i][j][oID]);
	            }
	        }
	    }
	}
	return 1;
}
public OnPlayerConnect(playerid)
{
	pData[playerid][TotalObjects] = 0;
	pData[playerid][MapEdit] = false;
	return 1;
}

CMD:createobjects(playerid,params[])
{
	if(!pData[playerid][MapEdit])
	{
	    new totalObjects = pData[playerid][TotalObjects];
	    new pPos[Vector3];
	    new oPos[Vector3];
	    new vVec[Vector3];
	    vVec = Vector_Init(0.0, 0.0, 10.0);
	    
	    pPos = GetPlayerPosVector3(playerid);
	    pPos = Vector_Add(pPos, vVec);
	    Vector_SCM(playerid, pPos);
	    //Create Center Object
		ObjData[playerid][totalObjects][oID] = CreateObject(O(CENTER),pPos[X],pPos[Y],pPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = true;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 0.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 90.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 180.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 270.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 45.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 135.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 225.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 315.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		
		//Upper layer
		
		vVec = Vector_Init(0.0, 0.0, 15.0);
		pPos = GetPlayerPosVector3(playerid);
	    pPos = Vector_Add(pPos, vVec);
	    Vector_SCM(playerid, pPos);
	    //Create Center Object
	    oPos = GetVecDistAngle(pPos, 0.0, 0.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 0.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 90.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 180.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 270.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 45.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 135.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 225.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 315.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		
		//Base layer
		vVec = Vector_Init(0.0, 0.0, 5.0);
		pPos = GetPlayerPosVector3(playerid);
	    pPos = Vector_Add(pPos, vVec);
	    Vector_SCM(playerid, pPos);
	    //Create Center Object
	    oPos = GetVecDistAngle(pPos, 0.0, 0.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 0.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 90.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 180.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 5.0, 270.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 45.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 135.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 225.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		//
		oPos = GetVecDistAngle(pPos, 7.07105, 315.0);
		ObjData[playerid][totalObjects][oID] = CreateObject(O(OTHER),oPos[X],oPos[Y],oPos[Z],0.0,0.0,0.0);
		ObjData[playerid][totalObjects][IsCenter] = false;
		totalObjects++;
		
		
		pData[playerid][TotalObjects] = totalObjects;
		pData[playerid][MapEdit] = true;
	}
	return 1;
}
CMD:stoprandomrotate(playerid,params[])
{
	if(pData[playerid][MapEdit])
	{
		KillTimer(pData[playerid][Timer]);
	}
	return 1;
}
CMD:randomrotate(playerid,params[])
{
	if(pData[playerid][MapEdit])
	{
	    new Axis[Vector3];
		new timerInterval;
	    new Float:Angle;
   		if(sscanf(params,"dffff",timerInterval,Axis[X],Axis[Y],Axis[Z],Angle)) return SendClientMessage(playerid,MAKE_COLOR(255,0,0,255),"Usage: /rotateobjects [axis(x,y,z)] [angle]");
		pData[playerid][Timer] = SetTimerEx("RotateObjects",timerInterval,1,"dffff",playerid, Axis[X], Axis[Y], Axis[Z], Angle);
	}
	return 1;
}
forward RotateObjects(playerid, Float:ax, Float:ay, Float:az, Float:angle);
public RotateObjects(playerid, Float:ax, Float:ay, Float:az, Float:angle)
{
	new Axis[Vector3];
	Axis = Vector_Init(ax, ay, az);
	new Float:Angle = angle;
	new vecs[3][Vector3];
	new oPos[Vector3];
	new cPos[Vector3];
	if(pData[playerid][MapEdit])
	{
		cPos = GetObjectPosVector3( ObjData[playerid][0][oID] );
		for(new i = 1; i < pData[playerid][TotalObjects]; i++) {
			oPos = GetObjectPosVector3( ObjData[playerid][i][oID] );
			oPos = Vector_Sub(oPos, cPos);
//			Vector_SCM(playerid, oPos);
			vecs[0] = Vector_Multiply(Vector_Sub(oPos, Vector_Multiply(Axis, Vector_Dot(oPos, Axis))), floatcos(Angle, degrees));
	        vecs[1] = Vector_Multiply(Vector_Cross(Axis, oPos), floatsin(Angle, degrees));
	        vecs[2] = Vector_Multiply(Axis, Vector_Dot(oPos,Axis));
			oPos = Vector_Add(vecs[0], vecs[1]);
			oPos = Vector_Add(oPos, vecs[2]);
			oPos = Vector_Add(oPos, cPos);
			SetObjectPos(ObjData[playerid][i][oID], oPos[X], oPos[Y], oPos[Z]);//, 0.0, 0.0, 0.0);
		}
	}
}
CMD:rotateobjects(playerid, params[])
{
	if(pData[playerid][MapEdit])
	{
		new Axis[Vector3];
		new Float:Angle;
		new vecs[3][Vector3];
		new oPos[Vector3];
		new cPos[Vector3];
		if(sscanf(params,"ffff",Axis[X],Axis[Y],Axis[Z],Angle)) return SendClientMessage(playerid,MAKE_COLOR(255,0,0,255),"Usage: /rotateobjects [axis(x,y,z)] [angle]");
		cPos = GetObjectPosVector3( ObjData[playerid][0][oID] );
		for(new i = 1; i < pData[playerid][TotalObjects]; i++) {
			oPos = GetObjectPosVector3( ObjData[playerid][i][oID] );
			oPos = Vector_Sub(oPos, cPos);
			Vector_SCM(playerid, oPos);
			vecs[0] = Vector_Multiply(Vector_Sub(oPos, Vector_Multiply(Axis, Vector_Dot(oPos, Axis))), floatcos(Angle, degrees));
	        vecs[1] = Vector_Multiply(Vector_Cross(Axis, oPos), floatsin(Angle, degrees));
	        vecs[2] = Vector_Multiply(Axis, Vector_Dot(oPos,Axis));
			oPos = Vector_Add(vecs[0], vecs[1]);
			oPos = Vector_Add(oPos, vecs[2]);
			oPos = Vector_Add(oPos, cPos);
			SetObjectPos(ObjData[playerid][i][oID], oPos[X], oPos[Y], oPos[Z]);//, 0.0, 0.0, 0.0);
		}
//		Quaternion_SCM(playerid, q);
	}
	return 1;
}
