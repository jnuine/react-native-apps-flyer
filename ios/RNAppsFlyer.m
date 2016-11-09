#import "RCTConvert.h"
#import "AppsFlyerTracker.h"
#import "RNAppsFlyer.h"

@implementation RCTConvert (EmailCryptType)

RCT_ENUM_CONVERTER(EmailCryptType, (@{
  @"none": @(EmailCryptTypeNone),
  @"md5": @(EmailCryptTypeMD5),
  @"sha1": @(EmailCryptTypeSHA1),
  }), EmailCryptTypeSHA1, intValue)

@end

@implementation RNAppsFlyer

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
    return @{
             @"eventNames": @{
                     @"AFEventLevelAchieved": AFEventLevelAchieved,
                     @"AFEventAddPaymentInfo": AFEventAddPaymentInfo,
                     @"AFEventAddToCart": AFEventAddToCart,
                     @"AFEventAddToWishlist": AFEventAddToWishlist,
                     @"AFEventCompleteRegistration": AFEventCompleteRegistration,
                     @"AFEventTutorial_completion": AFEventTutorial_completion,
                     @"AFEventInitiatedCheckout": AFEventInitiatedCheckout,
                     @"AFEventPurchase": AFEventPurchase,
                     @"AFEventRate": AFEventRate,
                     @"AFEventSearch": AFEventSearch,
                     @"AFEventSpentCredits": AFEventSpentCredits,
                     @"AFEventAchievementUnlocked": AFEventAchievementUnlocked,
                     @"AFEventContentView": AFEventContentView,
                     @"AFEventListView": AFEventListView,
                     @"AFEventTravelBooking": AFEventTravelBooking,
                     @"AFEventShare": AFEventShare,
                     @"AFEventInvite": AFEventInvite,
                     @"AFEventLogin": AFEventLogin,
                     @"AFEventReEngage": AFEventReEngage,
                     @"AFEventUpdate": AFEventUpdate,
                     @"AFEventOpenedFromPushNotification": AFEventOpenedFromPushNotification,
                     @"AFEventLocation": AFEventLocation,
                     },
             @"eventParams": @{
                     @"AFEventParamLevel": AFEventParamLevel,
                     @"AFEventParamScore": AFEventParamScore,
                     @"AFEventParamSuccess": AFEventParamSuccess,
                     @"AFEventParamPrice": AFEventParamPrice,
                     @"AFEventParamContentType": AFEventParamContentType,
                     @"AFEventParamContentId": AFEventParamContentId,
                     @"AFEventParamContentList": AFEventParamContentList,
                     @"AFEventParamCurrency": AFEventParamCurrency,
                     @"AFEventParamQuantity": AFEventParamQuantity,
                     @"AFEventParamRegistrationMethod": AFEventParamRegistrationMethod,
                     @"AFEventParamPaymentInfoAvailable": AFEventParamPaymentInfoAvailable,
                     @"AFEventParamMaxRatingValue": AFEventParamMaxRatingValue,
                     @"AFEventParamRatingValue": AFEventParamRatingValue,
                     @"AFEventParamSearchString": AFEventParamSearchString,
                     @"AFEventParamDateA": AFEventParamDateA,
                     @"AFEventParamDateB": AFEventParamDateB,
                     @"AFEventParamDestinationA": AFEventParamDestinationA,
                     @"AFEventParamDestinationB": AFEventParamDestinationB,
                     @"AFEventParamDescription": AFEventParamDescription,
                     @"AFEventParamClass": AFEventParamClass,
                     @"AFEventParamEventStart": AFEventParamEventStart,
                     @"AFEventParamEventEnd": AFEventParamEventEnd,
                     @"AFEventParamLat": AFEventParamLat,
                     @"AFEventParamLong": AFEventParamLong,
                     @"AFEventParamCustomerUserId": AFEventParamCustomerUserId,
                     @"AFEventParamValidated": AFEventParamValidated,
                     @"AFEventParamRevenue": AFEventParamRevenue,
                     @"AFEventParamReceiptId": AFEventParamReceiptId,
                     @"AFEventParam1": AFEventParam1,
                     @"AFEventParam2": AFEventParam2,
                     @"AFEventParam3": AFEventParam3,
                     @"AFEventParam4": AFEventParam4,
                     @"AFEventParam5": AFEventParam5,
                     @"AFEventParam6": AFEventParam6,
                     @"AFEventParam7": AFEventParam7,
                     @"AFEventParam8": AFEventParam8,
                     @"AFEventParam9": AFEventParam9,
                     @"AFEventParam10": AFEventParam10,
                     },
             @"emailCryptTypeEnum": @{
                     @"EmailCryptTypeNone": @(EmailCryptTypeNone),
                     @"EmailCryptTypeSHA1": @(EmailCryptTypeSHA1),
                     @"EmailCryptTypeMD5": @(EmailCryptTypeMD5),
                     },
             };
}

#define RCT_APPSFLYER_PROPERTY_SETTER(PropertyName, propertyName, propertyType) \
RCT_EXPORT_METHOD(set##PropertyName: (propertyType)value)                       \
{                                                                               \
    [AppsFlyerTracker sharedTracker].propertyName = value;                      \
}                                                                               \

#define RCT_APPSFLYER_OBJECT_PROPERTY(PropertyName, propertyName, propertyType) \
RCT_APPSFLYER_PROPERTY_SETTER(PropertyName, propertyName, propertyType)         \
RCT_EXPORT_METHOD(get##PropertyName: (RCTPromiseResolveBlock)resolve            \
                  rejecter: (RCTPromiseRejectBlock)reject)                      \
{                                                                               \
    propertyType propValue = [[AppsFlyerTracker sharedTracker] propertyName];   \
    resolve(propValue);                                                         \
}                                                                               \

#define RCT_APPSFLYER_BOOL_PROPERTY(PropertyName, propertyName)       \
RCT_APPSFLYER_PROPERTY_SETTER(PropertyName, propertyName, BOOL)       \
RCT_EXPORT_METHOD(get##PropertyName: (RCTPromiseResolveBlock)resolve  \
                  rejecter: (RCTPromiseRejectBlock)reject)            \
{                                                                     \
    BOOL propValue = [[AppsFlyerTracker sharedTracker] propertyName]; \
    resolve(@(propValue));                                            \
}

RCT_APPSFLYER_OBJECT_PROPERTY(AppleAppID, appleAppID, NSString*)
RCT_APPSFLYER_OBJECT_PROPERTY(AppsFlyerDevKey, appsFlyerDevKey, NSString*)
RCT_APPSFLYER_OBJECT_PROPERTY(CustomerUserID, customerUserID, NSString*)
RCT_APPSFLYER_OBJECT_PROPERTY(CustomData, customData, NSDictionary*)
RCT_APPSFLYER_OBJECT_PROPERTY(CurrencyCode, currencyCode, NSString*)

RCT_APPSFLYER_BOOL_PROPERTY(DisableAppleAdSupportTracking, disableAppleAdSupportTracking)
RCT_APPSFLYER_BOOL_PROPERTY(DisableIAdTracking, disableIAdTracking)
RCT_APPSFLYER_BOOL_PROPERTY(DeviceTrackingDisabled, deviceTrackingDisabled)
RCT_APPSFLYER_BOOL_PROPERTY(IsDebug, isDebug)
RCT_APPSFLYER_BOOL_PROPERTY(ShouldCollectDeviceName, shouldCollectDeviceName)
RCT_APPSFLYER_BOOL_PROPERTY(UseReceiptValidationSandbox, useReceiptValidationSandbox)

RCT_EXPORT_METHOD(setUserEmails:(NSArray *) userEmails withCryptType:(EmailCryptType) type)
{
    [[AppsFlyerTracker sharedTracker] setUserEmails:userEmails withCryptType:type];
}

RCT_EXPORT_METHOD(trackAppLaunch)
{
    [[AppsFlyerTracker sharedTracker] trackAppLaunch];
}

RCT_EXPORT_METHOD(sendTrackingWithEvent: (NSString *)eventName eventValues: (NSDictionary *)eventValues)
{
    [[AppsFlyerTracker sharedTracker] trackEvent:eventName withValues:eventValues];
}

RCT_REMAP_METHOD(trackEvent, eventName: (NSString *)eventName eventValue:(NSString *)eventValue)
{
    [[AppsFlyerTracker sharedTracker] trackEvent:eventName withValue:eventValue];
}

RCT_REMAP_METHOD(trackEvents, eventName: (NSString *)eventName eventValues:(NSDictionary *)eventValues)
{
    [[AppsFlyerTracker sharedTracker] trackEvent:eventName withValues:eventValues];
}

RCT_EXPORT_METHOD(trackLocation: (double)longitude latitude:(double)latitude)
{
    [[AppsFlyerTracker sharedTracker] trackLocation:longitude latitude:latitude];
}

RCT_EXPORT_METHOD(getAppsFlyerUID: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)
{
    NSString *uid = [[AppsFlyerTracker sharedTracker] getAppsFlyerUID];
    resolve(uid);
}

RCT_EXPORT_METHOD(validateAndTrackInAppPurchase: (NSString *)productIdentifier
                  price: (NSString *)price
                  currency: (NSString *)currency
                  transactionId: (NSString *)transactionId
                  additionalParameters: (NSDictionary *)params
                  resolver: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject)
{
    [[AppsFlyerTracker sharedTracker] validateAndTrackInAppPurchase: productIdentifier
                                                              price: price
                                                           currency: currency
                                                      transactionId: transactionId
                                               additionalParameters: params
                                                            success:^(NSDictionary *response) {
                                                                resolve(response);
                                                            }
                                                            failure:^(NSError *error, id reponse) {
                                                                reject(
                                                                       @"in_app_purchase_validaton_error",
                                                                       [error localizedDescription],
                                                                       error
                                                                );
                                                            }];
}


@end
