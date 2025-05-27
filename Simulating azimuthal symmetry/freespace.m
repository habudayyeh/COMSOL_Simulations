function out = freespace(phi)
%
% freespace.m
%
% Model exported on Nov 26 2016, 18:31 by COMSOL 5.2.0.166.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\Google Drive\PhD\Codes\COMSOL\Simulating azimuthal symmetry');

model.label('freespace.mph');

model.comments(['Untitled\n\n']);

model.param.set('lambda', '700 [nm]', 'wavelength');

model.modelNode.create('comp1');

model.geom.create('geom1', 2);

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);
model.geom('geom1').selection.create('csel1', 'CumulativeSelection');
model.geom('geom1').selection('csel1').label('line');
model.geom('geom1').selection.create('csel2', 'CumulativeSelection');
model.geom('geom1').selection('csel2').label('dip');
model.geom('geom1').create('r1', 'Rectangle');
model.geom('geom1').feature('r1').set('layerleft', true);
model.geom('geom1').feature('r1').set('size', {'10' '10'});
model.geom('geom1').feature('r1').setIndex('layer', 'lambda/2', 0);
model.geom('geom1').feature('r1').set('base', 'center');
model.geom('geom1').feature('r1').set('layername', {'Layer 1'});
model.geom('geom1').feature('r1').set('layerright', true);
model.geom('geom1').feature('r1').set('layertop', true);
model.geom('geom1').create('pt1', 'Point');
model.geom('geom1').feature('pt1').label('dipole_pos');
model.geom('geom1').feature('pt1').set('contributeto', 'csel2');
model.geom('geom1').create('pt2', 'Point');
model.geom('geom1').feature('pt2').label('dipole_pos 1');
model.geom('geom1').feature('pt2').setIndex('p', '0.01', 0, 0);
model.geom('geom1').feature('pt2').setIndex('p', '0', 1, 0);
model.geom('geom1').feature('pt2').set('contributeto', 'csel1');
model.geom('geom1').run;

model.material.create('mat1', 'Common', 'comp1');

model.coordSystem.create('pml1', 'geom1', 'PML');
model.coordSystem('pml1').selection.set([1 2 3 4 6 7 8 9]);

model.physics.create('emw', 'ElectromagneticWaves', 'geom1');
model.physics('emw').create('epd1', 'ElectricPointDipole', 0);
model.physics('emw').feature('epd1').selection.named('geom1_csel2_pnt');
model.physics('emw').create('sctr1', 'Scattering', 1);
model.physics('emw').feature('sctr1').selection.set([1 2 3 5 7 9 14 16 21 22 23 24]);
model.physics('emw').create('ffd1', 'FarFieldDomain', 2);
model.physics('emw').create('lco1', 'LineCurrentOutOfPlane', 0);
model.physics('emw').feature('lco1').selection.named('geom1_csel1_pnt');

model.view('view1').axis.set('abstractviewxscale', '0.051779936999082565');
model.view('view1').axis.set('ymin', '-8');
model.view('view1').axis.set('xmax', '16.517799377441406');
model.view('view1').axis.set('abstractviewyscale', '0.051779936999082565');
model.view('view1').axis.set('abstractviewbratio', '-0.30000001192092896');
model.view('view1').axis.set('abstractviewtratio', '0.30000001192092896');
model.view('view1').axis.set('abstractviewrratio', '1.1517798900604248');
model.view('view1').axis.set('xmin', '-16.517799377441406');
model.view('view1').axis.set('abstractviewlratio', '-1.1517798900604248');
model.view('view1').axis.set('ymax', '8');

model.material('mat1').label('air');
model.material('mat1').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat1').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});

model.physics('emw').prop('MeshControl').set('EnableMeshControl', '1');
model.physics('emw').prop('MeshControl').set('PhysicsControlledMeshMaximumElementSize', 'lambda/10');
% model.physics('emw').feature('epd1').set('enpI', {'1'; '0'; '0'});
% model.physics('emw').feature('epd1').set('normpI', sprintf('%f',sin(phi)));
% model.physics('emw').feature('lco1').set('Iop', sprintf('%f',cos(phi)));
model.physics('emw').feature('epd1').set('enpI', {sprintf('%f',sin(phi)); '0'; sprintf('%f',cos(phi))});
model.physics('emw').feature('epd1').set('normpI', '1');
model.physics('emw').feature('lco1').set('Iop', '0');
model.mesh('mesh1').run;

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PolarGroup');
model.result('pg1').create('surf1', 'Surface');
model.result('pg2').create('ff1', 'FarField');

model.study('std1').feature('freq').set('plist', 'c_const/lambda');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c_const/lambda'});
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').runAll;

model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg2').label('2D Far Field (emw)');
model.result('pg2').set('rmax', '242789.75');
model.result('pg2').set('axislimits', 'on');
model.result('pg2').feature('ff1').set('legend', true);

out = model;
