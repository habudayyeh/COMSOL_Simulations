function out = model(Main,Period,SlitHeight,ElementWidth,PolymerThickness)
%
% model.m
%
% Model exported on Sep 10 2016, 14:26 by COMSOL 5.2.0.166.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\Google Drive\PhD\Codes\COMSOL\Test_PZ Design_Center Flat');

model.label('TESTPz_Design_2D_center_flat_low.mph');

model.comments(['Pz Design 2D center flat low\n\n']);

model.param.set('Lambda', '800[nm]', 'wavelength');
model.param.set('PolymerThickness', sprintf('%d %s',PolymerThickness,'[nm]'));
model.param.set('d', '0.6*PolymerThickness');
model.param.set('Period', sprintf('%d %s',Period,'[nm]'));
model.param.set('SlitWidth', 'Period-ElementWidth');
model.param.set('SlitHeight', sprintf('%d %s',SlitHeight,'[nm]'));
model.param.set('ElementWidth', sprintf('%d %s',ElementWidth,'[nm]'));
model.param.set('Main', sprintf('%d %s',Main,'[nm]'), 'central cavity width');
model.param.set('NRings', '25');
model.param.set('MetalThickness', '100[nm]');
model.param.set('MetalLength', '2*(NRings+3)*Period');
model.param.set('nPolymer', '1.4457');
model.param.set('PolymerLength', 'Period*2*NRings');
model.param.set('RFarField', 'MetalLength/2+1[um]');
model.param.set('Metal_eps_real', '-23.483');
model.param.set('Metal_eps_imag', '1.766');
model.param.set('f0', 'c_const/Lambda');
model.param.set('Px', '1');
model.param.set('Pz', '0');
model.param.set('FirstPeriod', 'Period', 'first period');
model.param.set('MainHeight', 'SlitHeight');
model.param.set('Shift', '0');
model.param.set('polymer_eps', '2.21');

model.modelNode.create('comp1');

model.geom.create('geom1', 2);

model.modelNode('comp1').defineLocalCoord(false);

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);
model.geom('geom1').create('r1', 'Rectangle');
model.geom('geom1').feature('r1').label('Frame');
model.geom('geom1').feature('r1').set('layerleft', true);
model.geom('geom1').feature('r1').set('size', {'MetalLength+5[um]' '10[um]'});
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
model.geom('geom1').create('r8', 'Rectangle');
model.geom('geom1').feature('r8').active(false);
model.geom('geom1').feature('r8').label('Central Element');
model.geom('geom1').feature('r8').set('size', {'Main' 'SlitHeight'});
model.geom('geom1').feature('r8').set('base', 'center');
model.geom('geom1').feature('r8').set('pos', {'0' 'SlitHeight/2'});
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
model.geom('geom1').create('r6', 'Rectangle');
model.geom('geom1').feature('r6').active(false);
model.geom('geom1').feature('r6').label('2nd Right Element');
model.geom('geom1').feature('r6').set('size', {'(Period-SlitWidth)' 'SlitHeight'});
model.geom('geom1').feature('r6').set('base', 'center');
model.geom('geom1').feature('r6').set('pos', {'FirstPeriod+0.5*(Period)' '0.5*SlitHeight'});
model.geom('geom1').create('r7', 'Rectangle');
model.geom('geom1').feature('r7').active(false);
model.geom('geom1').feature('r7').label('2nd Left Element');
model.geom('geom1').feature('r7').set('size', {'Period-SlitWidth' 'SlitHeight'});
model.geom('geom1').feature('r7').set('base', 'center');
model.geom('geom1').feature('r7').set('pos', {'-FirstPeriod-0.5*Period' 'SlitHeight/2'});
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

model.selection.create('sel1', 'Explicit');
model.selection('sel1').geom('geom1', 1);
model.selection.create('sel2', 'Explicit');
model.selection('sel2').set([1 2 3 4 6 57 58 59]);
model.selection.create('sel3', 'Explicit');
model.selection('sel3').geom('geom1', 1);
model.selection.create('sel4', 'Explicit');
model.selection.create('sel5', 'Explicit');
model.selection.create('sel6', 'Explicit');
model.selection('sel6').set([7 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56]);
model.selection('sel1').label('Frame boundary');
model.selection('sel2').label('PML Domain');
model.selection('sel3').label('Far Field Boundary');
model.selection('sel4').label('Far Field domain');
model.selection('sel5').label('Metal Slits Domain');
model.selection('sel6').label('Al Metal Parts');

model.material.create('mat1', 'Common', 'comp1');
model.material.create('mat2', 'Common', 'comp1');
model.material.create('mat3', 'Common', 'comp1');
model.material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('Cp', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('rho', 'Analytic');
model.material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('cs', 'Analytic');
model.material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat2').selection.set([7 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56]);
model.material('mat2').propertyGroup('def').func.create('dL', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('CTE', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('k_solid_1', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('res_solid_1', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('alpha', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('C_solid_1', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('HC_solid_1', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('mu', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('sigma_solid_1', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('rho', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('VP_solid_1', 'Piecewise');
model.material('mat2').propertyGroup('def').func.create('kappa', 'Piecewise');
model.material('mat3').selection.set([8]);
model.material('mat3').propertyGroup('def').func.create('dL', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('alpha', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('mu', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('rho', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('TD', 'Piecewise');
model.material('mat3').propertyGroup('def').func.create('kappa', 'Piecewise');

model.coordSystem.create('pml1', 'geom1', 'PML');
model.coordSystem('pml1').selection.set([1 2 3 4 6 57 58 59]);

model.physics.create('emw', 'ElectromagneticWaves', 'geom1');
model.physics('emw').create('sctr1', 'Scattering', 1);
model.physics('emw').feature('sctr1').selection.set([1 2 3 5 7 9 14 263 268 269 270 271]);
model.physics('emw').create('epd1', 'ElectricPointDipole', 0);
model.physics('emw').feature('epd1').selection.set([108]);
model.physics('emw').create('lco1', 'LineCurrentOutOfPlane', 0);
model.physics('emw').feature('lco1').selection.set([108]);
model.physics('emw').create('ffd1', 'FarFieldDomain', 2);
model.physics('emw').feature('ffd1').selection.set([5]);
model.physics('emw').feature('ffd1').feature('ffc1').selection.geom('geom1', 1);
model.physics('emw').feature('ffd1').feature('ffc1').selection.set([10 11 13 264]);

model.mesh('mesh1').create('size2', 'Size');
model.mesh('mesh1').create('ftri1', 'FreeTri');
model.mesh('mesh1').create('map1', 'Map');
model.mesh('mesh1').feature('size2').selection.named('sel6');
model.mesh('mesh1').feature('ftri1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('ftri1').selection.set([5 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56]);
model.mesh('mesh1').feature('map1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('map1').selection.set([1 2 3 4 6 57 58 59]);
model.mesh('mesh1').feature('map1').create('dis1', 'Distribution');

model.view('view1').axis.set('abstractviewxscale', '0.11337719112634659');
model.view('view1').axis.set('ymin', '-23.456302642822266');
model.view('view1').axis.set('xmax', '25.283113479614258');
model.view('view1').axis.set('abstractviewyscale', '0.11337719857692719');
model.view('view1').axis.set('abstractviewbratio', '-1.3990681171417236');
model.view('view1').axis.set('abstractviewtratio', '1.3990681171417236');
model.view('view1').axis.set('abstractviewrratio', '0.05000000819563866');
model.view('view1').axis.set('xmin', '-25.283113479614258');
model.view('view1').axis.set('abstractviewlratio', '-0.05000000819563866');
model.view('view1').axis.set('ymax', '24.456302642822266');

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
model.material('mat2').label('Silver [solid]');
model.material('mat2').set('family', 'gold');
model.material('mat2').propertyGroup('def').func('dL').set('pieces', {'86.0' '1003.0' '-0.003767805+1.179943E-5*T^1+3.792275E-9*T^2-5.959619E-13*T^3'});
model.material('mat2').propertyGroup('def').func('dL').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('CTE').set('pieces', {'86.0' '200.0' '4.040319E-6+1.106436E-7*T^1-4.389255E-10*T^2+5.990814E-13*T^3'; '200.0' '1003.0' '1.237291E-5+5.169284E-9*T^1-5.528527E-14*T^2'});
model.material('mat2').propertyGroup('def').func('CTE').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('k_solid_1').set('pieces', {'0.0' '14.0' '496.8118*T^1+41.00857*T^2-10.46095*T^3+0.5579006*T^4-0.009429161*T^5';  ...
'14.0' '45.0' '7977.526-554.7566*T^1+14.56751*T^2-0.1468484*T^3+3.231278E-4*T^4';  ...
'45.0' '85.0' '3568.586-199.4435*T^1+5.171042*T^2-0.06880706*T^3+4.612091E-4*T^4-1.23215E-6*T^5';  ...
'85.0' '1338.0' '330.6431-0.02536626*T^1-8.191375E-5*T^2+6.792908E-8*T^3-2.15362E-11*T^4'});
model.material('mat2').propertyGroup('def').func('k_solid_1').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('res_solid_1').set('pieces', {'1.0' '25.0' '2.194815E-10+1.027514E-12*T^1-3.409278E-13*T^2+3.010164E-14*T^3';  ...
'25.0' '60.0' '1.390641E-9-1.228888E-10*T^1+4.182944E-12*T^2-2.773737E-14*T^3';  ...
'60.0' '400.0' '-2.210068E-9+9.057611E-11*T^1-4.632985E-14*T^2+6.950205E-17*T^3';  ...
'400.0' '1338.0' '-1.145028E-9+7.877041E-11*T^1-4.720065E-16*T^2+1.275961E-17*T^3'});
model.material('mat2').propertyGroup('def').func('res_solid_1').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('alpha').set('pieces', {'86.0' '212.0' '1.221837E-5+1.15298E-8*T^1-1.573678E-11*T^2'; '212.0' '1003.0' '1.436173E-5-4.015912E-9*T^1+1.10929E-11*T^2-5.625535E-15*T^3'});
model.material('mat2').propertyGroup('def').func('alpha').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('C_solid_1').set('pieces', {'293.0' '1338.0' '399352.2*T^-2+114.8987+0.03228805*T^1'});
model.material('mat2').propertyGroup('def').func('C_solid_1').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('HC_solid_1').set('pieces', {'293.0' '1338.0' '78659.2*T^-2+22.63126+0.00635968*T^1'});
model.material('mat2').propertyGroup('def').func('HC_solid_1').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('mu').set('pieces', {'293.0' '1280.0' '2.682905E10+142041.4*T^1-7037.486*T^2'});
model.material('mat2').propertyGroup('def').func('mu').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('sigma_solid_1').set('pieces', {'1.0' '25.0' '1/(3.010164E-14*T^3-3.409278E-13*T^2+1.027514E-12*T+2.194815E-10)';  ...
'25.0' '60.0' '1/(-2.773737E-14*T^3+4.182944E-12*T^2-1.228888E-10*T+1.390641E-09)';  ...
'60.0' '400.0' '1/(6.950205E-17*T^3-4.632985E-14*T^2+9.057611E-11*T-2.210068E-09)';  ...
'400.0' '1338.0' '1/(1.275961E-17*T^3-4.720065E-16*T^2+7.877041E-11*T-1.145028E-09)'});
model.material('mat2').propertyGroup('def').func('sigma_solid_1').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('rho').set('pieces', {'86.0' '1003.0' '19501.44-0.6933844*T^1-2.041944E-4*T^2+4.297982E-8*T^3'});
model.material('mat2').propertyGroup('def').func('rho').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('VP_solid_1').set('pieces', {'293.0' '1337.0' '(exp((-1.934300e+004/T-7.479000e-001*log10(T)+1.203281e+001)*log(10.0)))*1.333200e+002'});
model.material('mat2').propertyGroup('def').func('VP_solid_1').set('arg', 'T');
model.material('mat2').propertyGroup('def').func('kappa').set('pieces', {'293.0' '1280.0' '2.224306E11-913189.7*T^1-37420.01*T^2'});
model.material('mat2').propertyGroup('def').func('kappa').set('arg', 'T');
model.material('mat2').propertyGroup('def').set('dL', '(dL(T[1/K])-dL(Tempref[1/K]))/(1+dL(Tempref[1/K]))');
model.material('mat2').propertyGroup('def').set('CTE', 'CTE(T[1/K])[1/K]');
model.material('mat2').propertyGroup('def').set('thermalconductivity', {'k_solid_1(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_solid_1(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_solid_1(T[1/K])[W/(m*K)]'});
model.material('mat2').propertyGroup('def').set('resistivity', {'res_solid_1(T[1/K])[ohm*m]' '0' '0' '0' 'res_solid_1(T[1/K])[ohm*m]' '0' '0' '0' 'res_solid_1(T[1/K])[ohm*m]'});
model.material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'(alpha(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-293[K]))'});
model.material('mat2').propertyGroup('def').set('heatcapacity', 'C_solid_1(T[1/K])[J/(kg*K)]');
model.material('mat2').propertyGroup('def').set('HC', 'HC_solid_1(T[1/K])[J/(mol*K)]');
model.material('mat2').propertyGroup('def').set('mu', 'mu(T[1/K])[Pa]');
model.material('mat2').propertyGroup('def').set('electricconductivity', {'sigma_solid_1(T[1/K])[S/m]' '0' '0' '0' 'sigma_solid_1(T[1/K])[S/m]' '0' '0' '0' 'sigma_solid_1(T[1/K])[S/m]'});
model.material('mat2').propertyGroup('def').set('density', 'rho(T[1/K])[kg/m^3]');
model.material('mat2').propertyGroup('def').set('VP', 'VP_solid_1(T[1/K])[Pa]');
model.material('mat2').propertyGroup('def').set('kappa', 'kappa(T[1/K])[Pa]');
model.material('mat2').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat2').propertyGroup('def').set('relpermittivity', {'Metal_eps_real+Metal_eps_imag*j' '0' '0' '0' 'Metal_eps_real+Metal_eps_imag*j' '0' '0' '0' 'Metal_eps_real+Metal_eps_imag*j'});
model.material('mat2').propertyGroup('def').addInput('temperature');
model.material('mat2').propertyGroup('def').addInput('strainreferencetemperature');
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
model.material('mat3').propertyGroup('def').set('relpermittivity', {'polymer_eps' '0' '0' '0' 'polymer_eps' '0' '0' '0' 'polymer_eps'});
model.material('mat3').propertyGroup('def').addInput('temperature');
model.material('mat3').propertyGroup('def').addInput('strainreferencetemperature');

model.physics('emw').prop('BackgroundField').set('w0', '0');
model.physics('emw').feature('epd1').set('enpI', {'Px'; 'abs(1-Px)'; '0'});
model.physics('emw').feature('epd1').set('normpI', '1');
model.physics('emw').feature('lco1').set('Iop', '1');
model.physics('emw').feature('lco1').active(false);

model.mesh('mesh1').feature('size').set('hauto', 1);
model.mesh('mesh1').feature('size').set('custom', 'on');
model.mesh('mesh1').feature('size').set('hmax', 'Lambda/5');
model.mesh('mesh1').feature('size').set('hmin', '5.92E-4');
model.mesh('mesh1').feature('size2').set('custom', 'on');
model.mesh('mesh1').feature('size2').set('hmaxactive', true);
model.mesh('mesh1').feature('size2').set('hmin', '0.00658');
model.mesh('mesh1').feature('size2').set('hmax', 'Lambda/15');
model.mesh('mesh1').feature('size2').set('hminactive', false);
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
model.result('pg2').feature('ff1').set('data', 'dset1');
model.result.export.create('plot1', 'Plot');

model.study('std1').feature('freq').set('plist', 'f0');

model.sol('sol1').attach('std1');
model.sol('sol1').label('Solver 1');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'f0'});
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').runAll;

model.result.dataset('dset1').label('Solution 1');
model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('showlegendsmaxmin', true);
model.result('pg1').set('frametype', 'spatial');
model.result('pg2').feature('ff1').set('phidisc', '360');
model.result('pg2').feature('ff1').set('legend', true);
model.result.export('plot1').set('plotgroup', 'pg2');
model.result.export('plot1').set('filename', 'D:\Comsol Matlab Models\PzCenterFlat.txt');

out = model;
