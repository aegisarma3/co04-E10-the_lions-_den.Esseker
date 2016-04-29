//Secondary explosions

_v=_this select 0;
_int=_this select 1;
_Ex_type=["HelicopterExploSmall","SmallSecondary","HelicopterExploBig","R_60mm_HE","M_Mo_120mm_AT","M_Mo_82mm_AT","Missile_AGM_01_F"];
_list=[];

if (count _this > 2) then {_lifecheck=_this select 2};

//Generate intervals between explosions
while {_int>1} do
{
	_int=_int-1;
	_t=(random 10)+10;
	_list=_list+[_t];
};

_effect2pos = _v selectionposition "destructionEffect2";
//Create the explosions
{
	sleep _x;
	if ((((getposASL _v) select 2) < 0)) exitwith {};
	_b= (selectRandom _Ex_type) createvehicle (_v modelToWorld _effect2pos);
} foreach (_list);
