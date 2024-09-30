"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestCTDataFrame',
	#superclass : 'PackageManifest',
	#category : 'CT-DataFrame-Manifest',
	#package : 'CT-DataFrame',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #loadData: #false)) #'2022-07-02T20:03:22.88034+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #selectAllWithSubset: #false)) #'2024-09-30T22:21:22.794271+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleGRInstanceVariableCapitalizationRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#CTDataFrameIncome)) #'2019-09-21T22:25:12.0016+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleGRIvarNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#CTDataFrame)) #'2019-09-18T22:53:04.061897+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleGRParensFormattingRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #groupBy: #false)) #'2019-09-03T21:48:30.69427+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #groupByMean: #false)) #'2019-09-03T21:48:44.512263+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #groupBySum: #false)) #'2019-09-03T21:48:58.533697+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #groupBySummarize #false)) #'2019-09-03T21:49:05.580162+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #max: #false)) #'2019-09-03T21:49:33.96956+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #mean: #false)) #'2019-09-03T21:49:42.871174+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #min: #false)) #'2019-09-03T21:49:49.063482+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #rotate: #false)) #'2019-09-03T21:50:22.318035+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectAll #false)) #'2019-09-03T21:50:30.658163+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectAllValuesForField: #false)) #'2019-09-03T21:50:41.257405+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectEquals:with: #false)) #'2019-09-03T21:50:53.581543+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectGreaterThan:with: #false)) #'2019-09-03T21:51:00.625416+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectGreaterThanOrEqual:with: #false)) #'2019-09-03T21:51:09.076924+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectLessThan:with: #false)) #'2019-09-03T21:51:18.222964+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectLessThanOrEqual:with: #false)) #'2019-09-03T21:51:27.081699+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectUniqueValuesFor: #false)) #'2019-09-03T21:51:34.322433+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #standardDev: #false)) #'2019-09-03T21:52:31.423306+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #sum: #false)) #'2019-09-03T21:52:37.632252+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #summarize #false)) #'2019-09-03T21:53:13.893294+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #seriesDataWith: #false)) #'2019-09-05T18:47:23.535939+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #seriesGroupDataWith: #false)) #'2019-09-05T22:18:16.499943+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectEquals:with:and:with: #false)) #'2019-09-10T14:04:16.647206+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #addColumn:with: #false)) #'2019-09-21T22:05:33.540166+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #removeColumn: #false)) #'2019-09-23T22:55:51.834593+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #transformColumnData:with:replacingMatchesWith: #false)) #'2019-09-26T22:47:21.416166+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #initialize #false)) #'2021-03-09T20:02:53.638142+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectAllWithSubset: #false)) #'2021-03-15T20:48:28.857266+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #quantile: #false)) #'2021-03-27T17:23:03.659266+00:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleGRTempsFormattingRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #summarize #false)) #'2019-09-03T21:53:17.014134+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleGRUsesCurlyBraceArraysRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #quantile: #false)) #'2021-03-27T17:29:37.763266+00:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #standardDev: #false)) #'2023-08-30T20:40:44.91711+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #selectEquals:with: #false)) #'2018-06-20T21:54:37.441691+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#CTDataFrameIncome)) #'2019-09-21T22:25:17.90506+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleRBCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #selectAllWithSubset: #false)) #'2021-03-19T20:44:47.373266+00:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleRBImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #summarize #false)) #'2021-02-27T21:22:06.166862+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectAllWithSubset: #false)) #'2021-03-15T20:48:35.183266+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #standardDev: #false)) #'2021-03-15T20:59:20.551266+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #quantile: #false)) #'2021-03-27T17:29:49.891266+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #variance: #false)) #'2021-07-27T18:49:54.232059+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #selectAllValuesForField: #false)) #'2021-08-01T17:56:40.708059+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #seriesGroupDataWith: #false)) #'2021-08-01T17:58:57.644059+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #groupByVariance: #false)) #'2021-08-01T18:21:48.325059+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleRBModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #standardDev: #false)) #'2019-09-03T21:52:26.514519+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #variance: #false)) #'2021-07-27T18:49:41.003059+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #rotate: #false)) #'2018-07-23T20:48:27.051514+01:00') #(#(#RGMethodDefinition #(#CTDataFrame #quantile: #false)) #'2021-03-27T17:29:43.106266+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #variance: #false)) #'2021-07-27T18:49:49.203059+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleReTestClassNotInPackageWithTestEndingNameRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#CTDataFrameTest)) #'2024-09-17T21:58:02.361141+01:00') )
]

{ #category : 'code-critics' }
ManifestCTDataFrame class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CTDataFrame #rotate: #false)) #'2022-01-03T13:44:03.005168+00:00') #(#(#RGMethodDefinition #(#CTDataFrame #quantile: #false)) #'2022-07-03T18:13:01.388818+01:00') )
]
