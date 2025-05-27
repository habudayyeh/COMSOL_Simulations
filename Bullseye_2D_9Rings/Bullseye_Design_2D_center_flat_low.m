function out = Bullseye_Design_2D_center_flat_low(Main,Period,d,PolyThick,Pz)
%
% Bullseye_Design_2D_center_flat_low.m
%
% Model exported on Dec 8 2016, 20:29 by COMSOL 5.2.0.166.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\Google Drive\PhD\Codes\COMSOL\Pz_9Rings');

model.label('Bullseye_Design_2D_center_flat_low.mph');

model.comments(['Pz Design 2D center flat low\n\n']);

model.param.set('Lambda', '800[nm]', 'wavelength');
model.param.set('PolymerThickness',sprintf('%d [nm]',PolyThick) );%'330[nm]');
model.param.set('d', sprintf('%d [nm]',d) );%'225 [nm]');
model.param.set('Period',sprintf('%d [nm]',Period) );%'705[nm]');
model.param.set('SlitWidth', 'Period-ElementWidth');
model.param.set('SlitHeight', '150[nm]');
model.param.set('ElementWidth', '140[nm]');
model.param.set('Main',sprintf('%d [nm]',Main) );%'1600[nm]', 'central cavity width');
model.param.set('NRings', '9');
model.param.set('MetalThickness', '100[nm]');
model.param.set('MetalLength', '2*(NRings*Period)+Main');
model.param.set('nPolymer', '1.4867');
model.param.set('PolymerLength', 'Period*2*NRings');
model.param.set('RFarField', 'MetalLength/2+1[um]');
model.param.set('Metal_eps_real', '-24.851');
model.param.set('Metal_eps_imag', '1.8557');
model.param.set('f0', 'c_const/Lambda');
model.param.set('Px', '1');
model.param.set('Pz', sprintf('%f',Pz));
model.param.set('FirstPeriod', 'Period', 'first period');
model.param.set('MainHeight', 'SlitHeight');
model.param.set('Shift', '0');

model.modelNode.create('comp1');

model.geom.create('geom1', 2);

model.modelNode('comp1').defineLocalCoord(false);

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);
model.geom('geom1').create('r1', 'Rectangle');
model.geom('geom1').feature('r1').label('Frame');
model.geom('geom1').feature('r1').set('layerleft', true);
model.geom('geom1').feature('r1').set('size', {'MetalLength+2[um]' '5[um]'});
model.geom('geom1').feature('r1').setIndex('layer', '0.5[um]', 0);
model.geom('geom1').feature('r1').set('base', 'center');
model.geom('geom1').feature('r1').set('layername', {'Layer 1'});
model.geom('geom1').feature('r1').set('layerright', true);
model.geom('geom1').feature('r1').set('layertop', true);
model.geom('geom1').feature('r1').set('pos', {'0' '0.5'});
model.geom('geom1').create('pt1', 'Point');
model.geom('geom1').feature('pt1').setIndex('p', 'Shift', 0, 0);
model.geom('geom1').feature('pt1').setIndex('p', 'd', 1, 0);
model.geom('geom1').create('r2', 'Rectangle');
model.geom('geom1').feature('r2').label('Polymer layer');
model.geom('geom1').feature('r2').set('size', {'MetalLength' 'PolymerThickness'});
model.geom('geom1').feature('r2').set('base', 'center');
model.geom('geom1').feature('r2').set('pos', {'0' '0.5*PolymerThickness'});
model.geom('geom1').create('r3', 'Rectangle');
model.geom('geom1').feature('r3').label('Metal slab');
model.geom('geom1').feature('r3').set('layerleft', true);
model.geom('geom1').feature('r3').set('size', {'MetalLength' 'MetalThickness'});
model.geom('geom1').feature('r3').set('base', 'center');
model.geom('geom1').feature('r3').set('layerright', true);
model.geom('geom1').feature('r3').set('layertop', true);
model.geom('geom1').feature('r3').set('pos', {'0' '-MetalThickness/2'});
model.geom('geom1').create('r4', 'Rectangle');
model.geom('geom1').feature('r4').label('1st Right Element');
model.geom('geom1').feature('r4').set('size', {'ElementWidth' 'SlitHeight'});
model.geom('geom1').feature('r4').set('base', 'center');
model.geom('geom1').feature('r4').set('pos', {'Main/2+ElementWidth/2' 'SlitHeight/2'});
model.geom('geom1').create('r5', 'Rectangle');
model.geom('geom1').feature('r5').label('1st Left Element');
model.geom('geom1').feature('r5').set('size', {'ElementWidth' 'SlitHeight'});
model.geom('geom1').feature('r5').set('base', 'center');
model.geom('geom1').feature('r5').set('pos', {'-Main/2-ElementWidth/2' 'SlitHeight/2'});
model.geom('geom1').create('arr1', 'Array');
model.geom('geom1').feature('arr1').label('Right Array');
model.geom('geom1').feature('arr1').set('displ', {'Period' '0'});
model.geom('geom1').feature('arr1').set('size', {'NRings-1' '1'});
model.geom('geom1').feature('arr1').selection('input').set({'r4'});
model.geom('geom1').create('arr2', 'Array');
model.geom('geom1').feature('arr2').label('Left Array');
model.geom('geom1').feature('arr2').set('displ', {'-Period' '0'});
model.geom('geom1').feature('arr2').set('size', {'NRings-1' '1'});
model.geom('geom1').feature('arr2').selection('input').set({'r5'});
model.geom('geom1').run;
model.geom('geom1').run('fin');

model.selection.create('sel1', 'Explicit');
model.selection('sel1').set([7 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]);
model.selection('sel1').label('metal');

model.material.create('mat1', 'Common', 'comp1');
model.material.create('mat3', 'Common', 'comp1');
model.material.create('mat4', 'Common', 'comp1');
model.material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('Cp', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('rho', 'Analytic');
model.material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('cs', 'Analytic');
model.material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat3').selection.set([8]);
model.material('mat3').propertyGroup('def').func.create('dL', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('alpha', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('mu', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('rho', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('TD', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('kappa', 'Piecewise');
model.material('mat3').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.material('mat3').propertyGroup('Enu').func.create('E', 'Piecewise');
model.material('mat3').propertyGroup('Enu').func.create('nu', 'Piecewise');
model.material('mat4').selection.named('sel1');

model.coordSystem.create('pml1', 'geom1', 'PML');
model.coordSystem('pml1').selection.set([1 2 3 4 6 25 26 27]);

model.physics.create('emw', 'ElectromagneticWaves', 'geom1');
model.physics('emw').create('sctr1', 'Scattering', 1);
model.physics('emw').feature('sctr1').selection.set([1 2 3 5 7 9 14 103 108 109 110 111]);
model.physics('emw').create('epd1', 'ElectricPointDipole', 0);
model.physics('emw').feature('epd1').selection.set([44]);
model.physics('emw').create('ffd1', 'FarFieldDomain', 2);
model.physics('emw').feature('ffd1').selection.set([5]);
model.physics('emw').feature('ffd1').feature('ffc1').selection.geom('geom1', 1);
model.physics('emw').feature('ffd1').feature('ffc1').selection.set([10 11 13 104]);

model.mesh('mesh1').create('ftri1', 'FreeTri');
model.mesh('mesh1').create('map1', 'Map');
model.mesh('mesh1').feature('ftri1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('ftri1').selection.set([5 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]);
model.mesh('mesh1').feature('map1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('map1').selection.set([1 2 3 4 6 25 26 27]);
model.mesh('mesh1').feature('map1').create('dis1', 'Distribution');

model.view('view1').axis.set('abstractviewxscale', '0.012195736169815063');
model.view('view1').axis.set('ymin', '-1.7843666076660156');
model.view('view1').axis.set('xmax', '2.699094295501709');
model.view('view1').axis.set('abstractviewyscale', '0.012195735238492489');
model.view('view1').axis.set('abstractviewbratio', '0.043126679956912994');
model.view('view1').axis.set('abstractviewtratio', '-0.20317688584327698');
model.view('view1').axis.set('abstractviewrratio', '-0.33430975675582886');
model.view('view1').axis.set('xmin', '-5.081785202026367');
model.view('view1').axis.set('abstractviewlratio', '0.18804267048835754');
model.view('view1').axis.set('ymax', '1.9841156005859375');

model.material('mat1').label('Air');
model.material('mat1').set('family', 'air');
model.material('mat1').propertyGroup('def').func('eta').set('pieces', {'200.0' '1600.0' '-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4'});
model.material('mat1').propertyGroup('def').func('eta').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('Cp').set('pieces', {'200.0' '1600.0' '1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4'});
model.material('mat1').propertyGroup('def').func('Cp').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('rho').set('args', {'pA' 'T'});
model.material('mat1').propertyGroup('def').func('rho').set('expr', 'pA*0.02897/8.314/T');
model.material('mat1').propertyGroup('def').func('rho').set('dermethod', 'manual');
model.material('mat1').propertyGroup('def').func('rho').set('plotargs', {'pA' '0' '1'; 'T' '0' '1'});
model.material('mat1').propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.02897/8.314/T,pA)'; 'T' 'd(pA*0.02897/8.314/T,T)'});
model.material('mat1').propertyGroup('def').func('k').set('pieces', {'200.0' '1600.0' '-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4'});
model.material('mat1').propertyGroup('def').func('k').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('cs').set('args', {'T'});
model.material('mat1').propertyGroup('def').func('cs').set('expr', 'sqrt(1.4*287*T)');
model.material('mat1').propertyGroup('def').func('cs').set('dermethod', 'manual');
model.material('mat1').propertyGroup('def').func('cs').set('plotargs', {'T' '0' '1'});
model.material('mat1').propertyGroup('def').func('cs').set('argders', {'T' 'd(sqrt(1.4*287*T),T)'});
model.material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat1').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat1').propertyGroup('def').set('dynamicviscosity', 'eta(T[1/K])[Pa*s]');
model.material('mat1').propertyGroup('def').set('ratioofspecificheat', '1.4');
model.material('mat1').propertyGroup('def').set('electricconductivity', {'0[S/m]' '0' '0' '0' '0[S/m]' '0' '0' '0' '0[S/m]'});
model.material('mat1').propertyGroup('def').set('heatcapacity', 'Cp(T[1/K])[J/(kg*K)]');
model.material('mat1').propertyGroup('def').set('density', 'rho(pA[1/Pa],T[1/K])[kg/m^3]');
model.material('mat1').propertyGroup('def').set('thermalconductivity', {'k(T[1/K])[W/(m*K)]' '0' '0' '0' 'k(T[1/K])[W/(m*K)]' '0' '0' '0' 'k(T[1/K])[W/(m*K)]'});
model.material('mat1').propertyGroup('def').set('soundspeed', 'cs(T[1/K])[m/s]');
model.material('mat1').propertyGroup('def').addInput('temperature');
model.material('mat1').propertyGroup('def').addInput('pressure');
model.material('mat1').propertyGroup('RefractiveIndex').set('n', '');
model.material('mat1').propertyGroup('RefractiveIndex').set('ki', '');
model.material('mat1').propertyGroup('RefractiveIndex').set('n', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat1').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.material('mat3').label('PMMA [solid]');
model.material('mat3').propertyGroup('def').func('dL').set('pieces', {'293.0' '323.0' '0.00932912-1.1388E-4*T^1+2.8E-7*T^2'});
model.material('mat3').propertyGroup('def').func('dL').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('alpha').set('pieces', {'293.0' '323.0' '-3.184E-5+2.8E-7*T^1'});
model.material('mat3').propertyGroup('def').func('alpha').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('mu').set('pieces', {'68.0' '125.0' '2.7459E9'; '125.0' '400.0' '8.498712E8+3.971458E7*T^1-287911.7*T^2+846.344*T^3-0.9122308*T^4'});
model.material('mat3').propertyGroup('def').func('mu').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('rho').set('pieces', {'293.0' '323.0' '1159.216+0.3894996*T^1-9.707597E-4*T^2'});
model.material('mat3').propertyGroup('def').func('rho').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('TD').set('pieces', {'87.0' '308.0' '2.552466E-7-5.175922E-10*T^1+2.95724E-13*T^2'; '308.0' '460.0' '-7.896105E-6+8.38529E-8*T^1-3.249648E-10*T^2+5.518894E-13*T^3-3.476433E-16*T^4'});
model.material('mat3').propertyGroup('def').func('TD').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('kappa').set('pieces', {'68.0' '124.0' '7.923015E9'; '124.0' '400.0' '2.054283E10-2.194785E8*T^1+1354634.0*T^2-3721.425*T^3+3.647352*T^4'});
model.material('mat3').propertyGroup('def').func('kappa').set('arg', 'T');
model.material('mat3').propertyGroup('def').set('dL', '(dL(T[1/K])-dL(Tempref[1/K]))/(1+dL(Tempref[1/K]))');
model.material('mat3').propertyGroup('def').set('thermalexpansioncoefficient', {'(alpha(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-293[K]))'});
model.material('mat3').propertyGroup('def').set('mu', 'mu(T[1/K])[Pa]');
model.material('mat3').propertyGroup('def').set('density', 'rho(T[1/K])[kg/m^3]');
model.material('mat3').propertyGroup('def').set('TD', 'TD(T[1/K])[m^2/s]');
model.material('mat3').propertyGroup('def').set('kappa', 'kappa(T[1/K])[Pa]');
model.material('mat3').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat3').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.material('mat3').propertyGroup('def').set('relpermittivity', {'nPolymer^2' '0' '0' '0' 'nPolymer^2' '0' '0' '0' 'nPolymer^2'});
model.material('mat3').propertyGroup('def').addInput('temperature');
model.material('mat3').propertyGroup('def').addInput('strainreferencetemperature');
model.material('mat3').propertyGroup('Enu').func('E').set('pieces', {'68.0' '125.0' '7.3846E9'; '125.0' '400.0' '4.31023E9+6.934433E7*T^1-528212.9*T^2+1579.615*T^3-1.742098*T^4'});
model.material('mat3').propertyGroup('Enu').func('E').set('arg', 'T');
model.material('mat3').propertyGroup('Enu').func('nu').set('pieces', {'68.0' '124.0' '0.34502'; '124.0' '270.0' '0.6787961-0.006076254*T^1+3.893231E-5*T^2-1.066899E-7*T^3+1.037697E-10*T^4'; '270.0' '400.0' '6.00413-0.07428949*T^1+3.664807E-4*T^2-8.064015E-7*T^3+6.657131E-10*T^4'});
model.material('mat3').propertyGroup('Enu').func('nu').set('arg', 'T');
model.material('mat3').propertyGroup('Enu').set('youngsmodulus', 'E(T[1/K])[Pa]');
model.material('mat3').propertyGroup('Enu').set('poissonsratio', 'nu(T[1/K])');
model.material('mat3').propertyGroup('Enu').addInput('temperature');
model.material('mat4').label('Silver');
model.material('mat4').propertyGroup('def').set('relpermittivity', {'Metal_eps_real+j*Metal_eps_imag' '0' '0' '0' 'Metal_eps_real+j*Metal_eps_imag' '0' '0' '0' 'Metal_eps_real+j*Metal_eps_imag'});
model.material('mat4').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat4').propertyGroup('def').set('electricconductivity', {'6.3e7' '0' '0' '0' '6.3e7' '0' '0' '0' '6.3e7'});

model.physics('emw').prop('BackgroundField').set('Ebg', {'0'; '0'; '0'});
model.physics('emw').prop('BackgroundField').set('w0', '0');
model.physics('emw').feature('epd1').set('enpI', {'abs(1-Pz)'; '0'; 'Pz'});
model.physics('emw').feature('epd1').set('normpI', '1');

model.mesh('mesh1').feature('size').set('hauto', 1);
model.mesh('mesh1').feature('size').set('custom', 'on');
model.mesh('mesh1').feature('size').set('hmax', 'Lambda/5');
model.mesh('mesh1').feature('size').set('hmin', '5.92E-4');
model.mesh('mesh1').feature('map1').feature('dis1').set('type', 'predefined');
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

model.study('std1').feature('freq').set('plist', 'f0');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'f0'});
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').runAll;

model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg2').label('2D Far Field (emw)');
model.result('pg2').feature('ff1').set('phidisc', '360');
model.result('pg2').feature('ff1').set('legend', true);

out = model;
