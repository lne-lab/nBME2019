function out = model
%
% optic_seline.m
%
% Model exported on Jul 27 2018, 21:22 by COMSOL 5.3.0.316.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Adaptive Sampling\Medium Size Validation\NeuronSimulation');

model.comments(['Untitled\n\n']);

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('ec', 'ConductiveMedia', 'geom1');

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').activate('ec', true);

model.component('comp1').geom('geom1').lengthUnit('mm');
model.component('comp1').geom('geom1').create('imp1', 'Import');
model.component('comp1').geom('geom1').feature('imp1').set('filename', 'C:\Adaptive Sampling\Medium Size Validation\NeuronSimulation\optic_seline_thick.mphbin');
model.component('comp1').geom('geom1').feature('imp1').importData;

model.component('comp1').view('view1').hideObjects.create('hide1');
model.component('comp1').view('view1').hideObjects('hide1').init(3);
model.component('comp1').view('view1').hideObjects('hide1').add('imp1(1)', [1]);
model.component('comp1').view('view1').hideObjects('hide1').add('imp1(1)', [2]);
model.component('comp1').view('view1').hideObjects('hide1').add('imp1(1)', [3]);
model.component('comp1').view('view1').hideObjects('hide1').add('imp1(1)', [4]);

model.component('comp1').geom('geom1').run;

model.component('comp1').view('view1').set('hidestatus', 'ignore');

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').set([4]);
model.component('comp1').selection('sel1').label('Optic Nerve');
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').set([3]);
model.component('comp1').selection('sel2').label('CSF');
model.component('comp1').selection.create('sel3', 'Explicit');
model.component('comp1').selection('sel3').set([2]);
model.component('comp1').selection('sel3').label('Dura mater');
model.component('comp1').selection.create('sel4', 'Explicit');
model.component('comp1').selection('sel4').geom(2);

model.component('comp1').view('view1').hideEntities.create('hide1');
model.component('comp1').view('view1').hideEntities('hide1').geom(2);
model.component('comp1').view('view1').hideEntities('hide1').add([10]);
model.component('comp1').view('view1').hideEntities.create('hide2');
model.component('comp1').view('view1').hideEntities('hide2').geom(3);
model.component('comp1').view('view1').hideEntities('hide2').add([4]);
model.component('comp1').view('view1').hideEntities('hide2').add([4]);
model.component('comp1').view('view1').hideEntities('hide2').add([4]);
model.component('comp1').view('view1').hideEntities('hide2').add([4]);
model.component('comp1').view('view1').hideEntities('hide2').add([4]);
model.component('comp1').view('view1').set('hidestatus', 'hide');
model.component('comp1').view('view1').hideObjects.clear;
model.component('comp1').view('view1').hideEntities.clear;
model.component('comp1').view('view1').hideMesh.clear;
model.component('comp1').view('view1').hideEntities.create('hide1');
model.component('comp1').view('view1').hideEntities('hide1').geom(3);
model.component('comp1').view('view1').hideEntities('hide1').add([1]);
model.component('comp1').view('view1').hideEntities('hide1').add([2]);
model.component('comp1').view('view1').hideEntities('hide1').add([3]);

model.component('comp1').selection('sel4').set([11 12 14 19]);
model.component('comp1').selection.create('sel5', 'Explicit');

model.component('comp1').view('view1').hideObjects.clear;
model.component('comp1').view('view1').hideEntities.clear;
model.component('comp1').view('view1').hideMesh.clear;

model.component('comp1').selection('sel5').set([1]);
model.component('comp1').selection('sel5').label('PBS');
model.component('comp1').selection('sel4').label('Pia Mater');
model.component('comp1').selection.create('sel6', 'Explicit');
model.component('comp1').selection('sel6').label('Ground');
model.component('comp1').selection('sel6').set([]);

model.component('comp1').view('view1').hideEntities.create('hide1');
model.component('comp1').view('view1').hideEntities('hide1').geom(3);
model.component('comp1').view('view1').hideEntities('hide1').add([1]);
model.component('comp1').view('view1').hideEntities('hide1').add([2]);

model.component('comp1').selection('sel6').set([]);
model.component('comp1').selection('sel6').geom(2);
model.component('comp1').selection('sel6').set([1782]);

model.component('comp1').view('view1').hideEntities.create('hide2');
model.component('comp1').view('view1').hideEntities('hide2').geom(2);
model.component('comp1').view('view1').hideEntities('hide2').add([9]);
model.component('comp1').view('view1').hideEntities('hide2').add([10]);
model.component('comp1').view('view1').hideEntities('hide2').add([1995]);

model.component('comp1').selection('sel6').set([1785]);
model.component('comp1').selection.create('sel7', 'Explicit');
model.component('comp1').selection('sel7').label('Polyimide');
model.component('comp1').selection('sel7').set([5 6 7 8 9 10 11 12 13 14 19 20 21 22 24 26 27 30 31 32 37 38 65 66 67 68 69 70 247 248 249 250 251 252 253 254 255 256 261 262]);

model.component('comp1').view('view1').hideEntities('hide1').add([3]);
model.component('comp1').view('view1').hideEntities('hide1').add([4]);

model.component('comp1').selection('sel7').set([5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 24 26 27 30 31 32 37 38 39 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 63 64 65 66 67 68 69 70 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262]);

model.component('comp1').view('view1').hideEntities('hide1').add([58]);
model.component('comp1').view('view1').hideEntities('hide1').add([60]);

model.component('comp1').selection('sel7').set([5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 24 26 27 30 31 32 37 38 39 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 95 96 97 98 99 100 143 144 145 146 147 148 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262]);
model.component('comp1').selection.create('sel8', 'Explicit');
model.component('comp1').selection('sel8').label('Meshing spheres 1');
model.component('comp1').selection('sel8').label('Meshing spheres 2');
model.component('comp1').selection('sel8').set([71 72 73 74 84 86 93 94 219 220 221 222]);
model.component('comp1').selection.create('sel9', 'Explicit');
model.component('comp1').selection('sel9').label('Meshing spheres 1');

model.component('comp1').view('view1').hideEntities('hide1').add([72]);
model.component('comp1').view('view1').hideEntities('hide1').add([220]);
model.component('comp1').view('view1').hideEntities('hide1').add([84]);
model.component('comp1').view('view1').hideEntities('hide1').add([86]);
model.component('comp1').view('view1').hideEntities('hide1').add([74]);
model.component('comp1').view('view1').hideEntities('hide1').add([222]);
model.component('comp1').view('view1').hideEntities('hide1').add([221]);
model.component('comp1').view('view1').hideEntities('hide1').add([73]);
model.component('comp1').view('view1').hideEntities('hide1').add([219]);
model.component('comp1').view('view1').hideEntities('hide1').add([71]);
model.component('comp1').view('view1').hideEntities('hide1').add([93]);
model.component('comp1').view('view1').hideEntities('hide1').add([94]);

model.component('comp1').selection('sel9').set([75 76 81 82 188 190 197 198 243 244 245 246]);

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').selection.geom('geom1', 2);
model.component('comp1').material('mat1').selection.named('sel4');
model.component('comp1').material('mat1').label('Pia Mater');
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', '');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', '');
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'0.016'});
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat2').label('CSF');
model.component('comp1').material('mat2').selection.named('sel2');
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'1.7'});
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat3').selection.named('sel3');
model.component('comp1').material('mat3').label('DM');
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'6e-2'});
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material.create('mat4', 'Common');
model.component('comp1').material('mat4').selection.named('sel1');
model.component('comp1').material('mat4').propertyGroup('def').set('electricconductivity', {'1'});
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity', {'0'});
model.component('comp1').material.create('mat5', 'Common');
model.component('comp1').material('mat5').selection.named('sel7');
model.component('comp1').material('mat5').propertyGroup('def').set('electricconductivity', {'6.7e-18'});
model.component('comp1').material('mat5').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material.create('mat6', 'Common');
model.component('comp1').material('mat6').label('PBS');
model.component('comp1').material('mat6').selection.named('sel5');
model.component('comp1').material('mat6').propertyGroup('def').set('electricconductivity', {'80'});
model.component('comp1').material('mat6').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material('mat4').label('ON');
model.component('comp1').material('mat5').label('Polyimide');
model.component('comp1').material.duplicate('mat7', 'mat4');
model.component('comp1').material.duplicate('mat8', 'mat7');
model.component('comp1').material('mat7').label('Meshing sphere 1');
model.component('comp1').material('mat7').selection.named('sel9');
model.component('comp1').material('mat8').label('Meshing sphere 2');
model.component('comp1').material('mat8').selection.named('sel8');

model.component('comp1').physics('ec').create('cucn2', 'CurrentConservation', 3);
model.component('comp1').physics('ec').feature('cucn2').selection.named('sel1');
model.component('comp1').physics('ec').feature('cucn2').set('sigma_mat', 'userdef');
model.component('comp1').physics('ec').feature('cucn2').set('sigma', [0.5 0 0 0 0.08 0 0 0 0.08]);
model.component('comp1').physics('ec').create('ci1', 'ContactImpedance', 2);
model.component('comp1').physics('ec').feature('ci1').label('Pia Mater Assumption');
model.component('comp1').physics('ec').feature('ci1').selection.named('sel4');
model.component('comp1').physics('ec').feature('ci1').set('ds', '10[um]');
model.component('comp1').physics('ec').feature('cucn2').label('ON Anisotropy');
model.component('comp1').physics('ec').feature.duplicate('cucn3', 'cucn2');
model.component('comp1').physics('ec').feature('cucn3').selection.named('sel8');
model.component('comp1').physics('ec').feature.duplicate('cucn4', 'cucn3');
model.component('comp1').physics('ec').feature('cucn4').selection.named('sel9');
model.component('comp1').physics('ec').create('gnd1', 'Ground', 2);
model.component('comp1').physics('ec').feature('gnd1').selection.named('sel6');
model.component('comp1').physics('ec').create('bcs1', 'BoundaryCurrentSource', 2);
model.component('comp1').physics('ec').feature('bcs1').label('Electrode a');

model.component('comp1').view('view1').hideEntities('hide1').add([76]);
model.component('comp1').view('view1').hideEntities('hide1').add([244]);
model.component('comp1').view('view1').hideEntities('hide1').add([243]);
model.component('comp1').view('view1').hideEntities('hide1').add([75]);
model.component('comp1').view('view1').hideEntities('hide1').add([188]);
model.component('comp1').view('view1').hideEntities('hide1').add([190]);
model.component('comp1').view('view1').hideEntities('hide1').add([197]);
model.component('comp1').view('view1').hideEntities('hide1').add([198]);
model.component('comp1').view('view1').hideEntities('hide1').add([82]);
model.component('comp1').view('view1').hideEntities('hide1').add([246]);
model.component('comp1').view('view1').hideEntities('hide1').add([245]);
model.component('comp1').view('view1').hideEntities('hide1').add([81]);

model.component('comp1').physics('ec').feature('bcs1').selection.set([1003]);
model.component('comp1').physics('ec').feature.duplicate('bcs2', 'bcs1');
model.component('comp1').physics('ec').feature('bcs2').label('Electrode b');
model.component('comp1').physics('ec').feature('bcs2').selection.set([1297]);
model.component('comp1').physics('ec').feature.duplicate('bcs3', 'bcs2');
model.component('comp1').physics('ec').feature('bcs3').label('Electrode c');
model.component('comp1').physics('ec').feature('bcs3').selection.set([1294]);
model.component('comp1').physics('ec').feature.duplicate('bcs4', 'bcs3');
model.component('comp1').physics('ec').feature('bcs4').selection.set([1000]);
model.component('comp1').physics('ec').feature('bcs4').label('Electrode d');
model.component('comp1').physics('ec').feature.duplicate('bcs5', 'bcs4');
model.component('comp1').physics('ec').feature('bcs5').label('Electrode e');
model.component('comp1').physics('ec').feature('bcs5').selection.set([1017]);
model.component('comp1').physics('ec').feature.duplicate('bcs6', 'bcs5');
model.component('comp1').physics('ec').feature('bcs6').label('Electrode f');
model.component('comp1').physics('ec').feature('bcs6').selection.set([1311]);
model.component('comp1').physics('ec').feature.duplicate('bcs7', 'bcs6');
model.component('comp1').physics('ec').feature('bcs7').label('Electrode g');
model.component('comp1').physics('ec').feature('bcs7').selection.set([1308]);
model.component('comp1').physics('ec').feature.duplicate('bcs8', 'bcs7');
model.component('comp1').physics('ec').feature('bcs8').label('Electrode h');
model.component('comp1').physics('ec').feature('bcs8').selection.set([1014]);
model.component('comp1').physics('ec').feature.duplicate('bcs9', 'bcs8');
model.component('comp1').physics('ec').feature('bcs9').label('Electrode i');
model.component('comp1').physics('ec').feature('bcs9').selection.set([1123]);
model.component('comp1').physics('ec').feature.duplicate('bcs10', 'bcs9');
model.component('comp1').physics('ec').feature('bcs10').label('Electrode j');
model.component('comp1').physics('ec').feature('bcs10').selection.set([1131]);
model.component('comp1').physics('ec').feature.duplicate('bcs11', 'bcs10');
model.component('comp1').physics('ec').feature('bcs11').selection.set([1120]);
model.component('comp1').physics('ec').feature('bcs11').label('Electrode k');
model.component('comp1').physics('ec').feature.duplicate('bcs12', 'bcs11');
model.component('comp1').physics('ec').feature('bcs12').label('Electrode l');
model.component('comp1').physics('ec').feature('bcs12').selection.set([1128]);
model.component('comp1').physics('ec').feature('bcs12').set('Qjs', 0);
model.component('comp1').physics('ec').feature('bcs10').set('Qjs', '-1[uA]/8276[um^2]');

model.component('comp1').mesh('mesh1').create('ftet1', 'FreeTet');
model.component('comp1').mesh('mesh1').feature('size').set('hauto', 4);
model.component('comp1').mesh('mesh1').feature('ftet1').label('Meshing Spheres 1');
model.component('comp1').mesh('mesh1').feature('ftet1').selection.geom('geom1', 3);
model.component('comp1').mesh('mesh1').feature('ftet1').selection.named('sel9');
model.component('comp1').mesh('mesh1').feature('ftet1').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('custom', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmaxactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.08);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 0.002);
model.component('comp1').mesh('mesh1').create('ftet2', 'FreeTet');
model.component('comp1').mesh('mesh1').feature('ftet2').selection.geom('geom1', 3);
model.component('comp1').mesh('mesh1').feature('ftet2').selection.named('sel8');
model.component('comp1').mesh('mesh1').feature('ftet2').label('Meshing spheres 2');
model.component('comp1').mesh('mesh1').feature('ftet2').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('custom', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmaxactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmax', 1);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmin', 0.004);
model.component('comp1').mesh('mesh1').create('ftet3', 'FreeTet');
model.component('comp1').mesh('mesh1').feature('ftet3').label('Optic Nerve');
model.component('comp1').mesh('mesh1').feature('ftet3').selection.geom('geom1', 3);
model.component('comp1').mesh('mesh1').feature('ftet3').selection.named('sel1');
model.component('comp1').mesh('mesh1').feature('ftet3').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftet3').feature('size1').set('custom', true);
model.component('comp1').mesh('mesh1').feature('ftet3').feature('size1').set('hmaxactive', true);
model.component('comp1').mesh('mesh1').feature('ftet3').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('ftet3').feature('size1').set('hmax', 1);
model.component('comp1').mesh('mesh1').feature('ftet3').feature('size1').set('hmin', 0.04);
model.component('comp1').mesh('mesh1').create('ftet4', 'FreeTet');
model.component('comp1').mesh('mesh1').feature('ftet4').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftet4').feature('size1').set('hauto', 4);
model.component('comp1').mesh('mesh1').run;

model.sol.create('sol1');
model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup3D');
model.result('pg1').label('Electric Potential (ec)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('data', 'dset1');
model.result('pg1').feature.create('mslc1', 'Multislice');
model.result('pg1').feature('mslc1').set('data', 'parent');
model.result.remove('pg1');

model.component('comp1').selection.create('sel10', 'Explicit');
model.component('comp1').selection('sel10').all;
model.component('comp1').selection('sel10').set([23 25 28 29 33 34 35 36 40 41 42 77 78 79 80 83 85 87 88 89 90 91 92 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 189 191 192 193 194 195 196 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242]);
model.component('comp1').selection('sel10').label('Polyimide 2');

model.component('comp1').material.duplicate('mat9', 'mat5');
model.component('comp1').material('mat9').selection.named('sel10');
model.component('comp1').material('mat9').label('Polyimide 2');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup3D');
model.result('pg1').label('Electric Potential (ec)');
model.result('pg1').set('solvertype', 'none');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('data', 'dset1');
model.result('pg1').feature.create('mslc1', 'Multislice');
model.result('pg1').feature('mslc1').set('solvertype', 'none');
model.result('pg1').feature('mslc1').set('data', 'parent');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').create('vol1', 'Volume');
model.result('pg1').feature('vol1').set('unit', 'mV');
model.result('pg1').run;
model.result('pg1').feature('vol1').set('colortablesym', true);

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 0.001);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.05);
model.component('comp1').mesh('mesh1').feature('ftet2').feature('size1').set('hmin', 0.01);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').stat.setQualityMeasure('skewness');

model.component('comp1').view('view1').hideObjects.clear;
model.component('comp1').view('view1').hideEntities.clear;
model.component('comp1').view('view1').hideMesh.clear;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.1);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.2);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 0.002);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.05);
model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.1);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.2);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 0.005);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.1);

model.sol('sol1').updateSolution;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.05);

model.sol('sol1').updateSolution;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 0.002);
model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.1);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.2);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 0.1);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmin', 0.01);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').mesh('mesh1').feature('ftet1').feature('size1').set('hmax', 0.1);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'cg');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'amg');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'i1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

out = model;
