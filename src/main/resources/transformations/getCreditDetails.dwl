%dw 2.0
output application/json
---
payload.resultSet map (value,index) -> ({
  "customerName" : {
  "firstName" : value.FirstName,
  "lastName" : value.LastName
  },
  "score" : value.Score,
  "type" : value.ScoreType,
  "creditReporter" : value.CreditReporter,
  "totalAccounts" : value.TotalAccounts,
  "lengthOfCredit" : {
    "years" : value.LengthOfCreditYears,
    "months" : value.LengthOfCreditMonths,
    "days" : value.LengthOfCreditDays
  },
  "inquiries" : value.inquires map(inquiryValue,inquiryIndex) -> ({
    "type" : inquiryValue.'type',
    "dateInquired" : inquiryValue.date,
    "vendor" : {
      "name" : inquiryValue.vendor.name,
      "type" : inquiryValue.vendor.'type',
      "cardType" : inquiryValue.vendor.cardType
    },
    "expiry" : inquiryValue.expiryDate
  }),
  "missedPayments" : value.missedPayments
})