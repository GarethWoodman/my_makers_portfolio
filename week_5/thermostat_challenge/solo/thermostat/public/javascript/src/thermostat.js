'use strict';
class Thermostat {

constructor() { 
  this.temperature = 20;
  this.MINIMUM_TEMPERATURE = 10;
  this.powerSavingMode = true;
  this.MAX_LIMIT_PSM_ON = 25;
  this.MAX_LIMIT_PSM_OFF = 32;
  this.DEFAULT_TEMPERATURE = 20;
  this.MEDIUM_ENERGY_USAGE_LIMIT = 18;
}

isMinimumTemperature() {
  return this.temperature === this.MINIMUM_TEMPERATURE;
}

  getCurrentTemperature(){
    return this.temperature;
  }
  up(){
    if (this.isMaximumTemperature()) {
  return;
    }
  this.temperature++;
  }

  down(){
    if (this.isMinimumTemperature()) {
      return;
    }
    return this.temperature--;
  }
  isPowerSavingModeOn(){
   return this.powerSavingMode === true;
  }

  switchPowerSavingModeOff() {
    this.powerSavingMode = false;
  }

  switchPowerSavingModeOn() {
    this.powerSavingMode = true;
  }

  isPowerSavingModeOff(){
    return this.powerSavingMode === false;
  }

  isMaximumTemperature() {
    if (this.isPowerSavingModeOn() === false) {
      return this.temperature === this.MAX_LIMIT_PSM_OFF
    }
    else {
    return this.temperature === this.MAX_LIMIT_PSM_ON;
    
    }
  }
  resetTemperature(){
    return this.temperature = this.DEFAULT_TEMPERATURE
  }

  energyUsage() {
    if (this.temperature < this.MEDIUM_ENERGY_USAGE_LIMIT) {
      return 'low-usage';
    }
    if (this.temperature >= this.MEDIUM_ENERGY_USAGE_LIMIT && this.temperature <= this.MAX_LIMIT_PSM_ON) {
      return 'medium-usage';
    }
      return 'high-usage';
  }
}
