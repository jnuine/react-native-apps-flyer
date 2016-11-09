import { NativeModules } from 'react-native';

const { RNAppsFlyer } = NativeModules;

const { trackEventWithValue, trackEventWithValues } = RNAppsFlyer;

function trackEvent (name, payload) {
  if (typeof payload === 'object') {
    return trackEventWithValues.call(RNAppsFlyer, name, payload);
  }

  if (typeof payload === 'string') {
    return trackEventWithValue.call(RNAppsFlyer, name, payload);
  }

  return trackEventWithValue.call(RNAppsFlyer, name, '');
}

const exportedRNAppsFlyer = (
  Object.getOwnPropertyNames(RNAppsFlyer) // does this get all the properties?..
    .filter(
      propertyName => (
        propertyName !== 'trackEventWithValue' ||
        propertyName !== 'trackEventWithValues'
      )
    )
    .reduce(
      (exportedRNAppsFlyer, propertyName) => {
        const property = RNAppsFlyer[propertyName];

        // methods
        if (typeof property === 'function') {
          const boundMethod = property.bind(RNAppsFlyer);
          return {
            ...exportedRNAppsFlyer,
            [propertyName]: boundMethod,
          };
        }

        return {
          ...exportedRNAppsFlyer,
          [propertyName]: property,
        };
      },
      { trackEvent }
    )
);

export default exportedRNAppsFlyer;
