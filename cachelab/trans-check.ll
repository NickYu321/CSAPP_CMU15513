; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"M > 0\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"trans.c\00", align 1
@__PRETTY_FUNCTION__.trans_basic = private unnamed_addr constant [73 x i8] c"void trans_basic(size_t, size_t, double (*)[M], double (*)[N], double *)\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"N > 0\00", align 1
@.str.6 = private unnamed_addr constant [25 x i8] c"is_transpose(M, N, A, B)\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [72 x i8] c"Transpose incorrect.  Fails for B[%zd][%zd] = %.3f, A[%zd][%zd] = %.3f\0A\00", align 1
@__PRETTY_FUNCTION__.trans_tmp = private unnamed_addr constant [71 x i8] c"void trans_tmp(size_t, size_t, double (*)[M], double (*)[N], double *)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @registerFunctions() #0 !dbg !10 {
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !14
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @trans_basic, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !15
  call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !16
  ret void, !dbg !17
}

declare void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !18 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca double, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !30, metadata !DIExpression()), !dbg !31
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !32, metadata !DIExpression()), !dbg !33
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !34, metadata !DIExpression()), !dbg !35
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !36, metadata !DIExpression()), !dbg !37
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !38, metadata !DIExpression()), !dbg !39
  %17 = load i64, i64* %7, align 8, !dbg !40
  %18 = load i64, i64* %6, align 8, !dbg !41
  %19 = load i64, i64* %6, align 8, !dbg !42
  %20 = load i64, i64* %7, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %11, metadata !44, metadata !DIExpression()), !dbg !45
  store i64 8, i64* %11, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata double* %12, metadata !46, metadata !DIExpression()), !dbg !47
  %21 = load i64, i64* %6, align 8, !dbg !48
  %22 = load i64, i64* %7, align 8, !dbg !50
  %23 = icmp eq i64 %21, %22, !dbg !51
  br i1 %23, label %24, label %120, !dbg !52

24:                                               ; preds = %5
  %25 = load i64, i64* %6, align 8, !dbg !53
  %26 = icmp eq i64 %25, 32, !dbg !55
  br i1 %26, label %30, label %27, !dbg !56

27:                                               ; preds = %24
  %28 = load i64, i64* %6, align 8, !dbg !57
  %29 = icmp eq i64 %28, 1024, !dbg !58
  br i1 %29, label %30, label %113, !dbg !59

30:                                               ; preds = %27, %24
  call void @llvm.dbg.declare(metadata i64* %13, metadata !60, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %13, align 8, !dbg !63
  br label %31, !dbg !64

31:                                               ; preds = %108, %30
  %32 = load i64, i64* %13, align 8, !dbg !65
  %33 = load i64, i64* %6, align 8, !dbg !67
  %34 = icmp ult i64 %32, %33, !dbg !68
  br i1 %34, label %35, label %112, !dbg !69

35:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata i64* %14, metadata !70, metadata !DIExpression()), !dbg !73
  store i64 0, i64* %14, align 8, !dbg !73
  br label %36, !dbg !74

36:                                               ; preds = %103, %35
  %37 = load i64, i64* %14, align 8, !dbg !75
  %38 = load i64, i64* %6, align 8, !dbg !77
  %39 = icmp ult i64 %37, %38, !dbg !78
  br i1 %39, label %40, label %107, !dbg !79

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i64* %15, metadata !80, metadata !DIExpression()), !dbg !83
  %41 = load i64, i64* %13, align 8, !dbg !84
  store i64 %41, i64* %15, align 8, !dbg !83
  br label %42, !dbg !85

42:                                               ; preds = %99, %40
  %43 = load i64, i64* %15, align 8, !dbg !86
  %44 = load i64, i64* %13, align 8, !dbg !88
  %45 = load i64, i64* %11, align 8, !dbg !89
  %46 = add i64 %44, %45, !dbg !90
  %47 = icmp ult i64 %43, %46, !dbg !91
  br i1 %47, label %48, label %102, !dbg !92

48:                                               ; preds = %42
  call void @llvm.dbg.declare(metadata i64* %16, metadata !93, metadata !DIExpression()), !dbg !96
  %49 = load i64, i64* %14, align 8, !dbg !97
  store i64 %49, i64* %16, align 8, !dbg !96
  br label %50, !dbg !98

50:                                               ; preds = %83, %48
  %51 = load i64, i64* %16, align 8, !dbg !99
  %52 = load i64, i64* %14, align 8, !dbg !101
  %53 = load i64, i64* %11, align 8, !dbg !102
  %54 = add i64 %52, %53, !dbg !103
  %55 = icmp ult i64 %51, %54, !dbg !104
  br i1 %55, label %56, label %86, !dbg !105

56:                                               ; preds = %50
  %57 = load i64, i64* %15, align 8, !dbg !106
  %58 = load i64, i64* %16, align 8, !dbg !109
  %59 = icmp ne i64 %57, %58, !dbg !110
  br i1 %59, label %60, label %74, !dbg !111

60:                                               ; preds = %56
  %61 = load double*, double** %8, align 8, !dbg !112
  %62 = load i64, i64* %15, align 8, !dbg !114
  %63 = mul nsw i64 %62, %18, !dbg !112
  %64 = getelementptr inbounds double, double* %61, i64 %63, !dbg !112
  %65 = load i64, i64* %16, align 8, !dbg !115
  %66 = getelementptr inbounds double, double* %64, i64 %65, !dbg !112
  %67 = load double, double* %66, align 8, !dbg !112
  %68 = load double*, double** %9, align 8, !dbg !116
  %69 = load i64, i64* %16, align 8, !dbg !117
  %70 = mul nsw i64 %69, %20, !dbg !116
  %71 = getelementptr inbounds double, double* %68, i64 %70, !dbg !116
  %72 = load i64, i64* %15, align 8, !dbg !118
  %73 = getelementptr inbounds double, double* %71, i64 %72, !dbg !116
  store double %67, double* %73, align 8, !dbg !119
  br label %82, !dbg !120

74:                                               ; preds = %56
  %75 = load double*, double** %8, align 8, !dbg !121
  %76 = load i64, i64* %15, align 8, !dbg !123
  %77 = mul nsw i64 %76, %18, !dbg !121
  %78 = getelementptr inbounds double, double* %75, i64 %77, !dbg !121
  %79 = load i64, i64* %16, align 8, !dbg !124
  %80 = getelementptr inbounds double, double* %78, i64 %79, !dbg !121
  %81 = load double, double* %80, align 8, !dbg !121
  store double %81, double* %12, align 8, !dbg !125
  br label %82

82:                                               ; preds = %74, %60
  br label %83, !dbg !126

83:                                               ; preds = %82
  %84 = load i64, i64* %16, align 8, !dbg !127
  %85 = add i64 %84, 1, !dbg !127
  store i64 %85, i64* %16, align 8, !dbg !127
  br label %50, !dbg !128, !llvm.loop !129

86:                                               ; preds = %50
  %87 = load i64, i64* %13, align 8, !dbg !131
  %88 = load i64, i64* %14, align 8, !dbg !133
  %89 = icmp eq i64 %87, %88, !dbg !134
  br i1 %89, label %90, label %98, !dbg !135

90:                                               ; preds = %86
  %91 = load double, double* %12, align 8, !dbg !136
  %92 = load double*, double** %9, align 8, !dbg !138
  %93 = load i64, i64* %15, align 8, !dbg !139
  %94 = mul nsw i64 %93, %20, !dbg !138
  %95 = getelementptr inbounds double, double* %92, i64 %94, !dbg !138
  %96 = load i64, i64* %15, align 8, !dbg !140
  %97 = getelementptr inbounds double, double* %95, i64 %96, !dbg !138
  store double %91, double* %97, align 8, !dbg !141
  br label %98, !dbg !142

98:                                               ; preds = %90, %86
  br label %99, !dbg !143

99:                                               ; preds = %98
  %100 = load i64, i64* %15, align 8, !dbg !144
  %101 = add i64 %100, 1, !dbg !144
  store i64 %101, i64* %15, align 8, !dbg !144
  br label %42, !dbg !145, !llvm.loop !146

102:                                              ; preds = %42
  br label %103, !dbg !148

103:                                              ; preds = %102
  %104 = load i64, i64* %11, align 8, !dbg !149
  %105 = load i64, i64* %14, align 8, !dbg !150
  %106 = add i64 %105, %104, !dbg !150
  store i64 %106, i64* %14, align 8, !dbg !150
  br label %36, !dbg !151, !llvm.loop !152

107:                                              ; preds = %36
  br label %108, !dbg !154

108:                                              ; preds = %107
  %109 = load i64, i64* %11, align 8, !dbg !155
  %110 = load i64, i64* %13, align 8, !dbg !156
  %111 = add i64 %110, %109, !dbg !156
  store i64 %111, i64* %13, align 8, !dbg !156
  br label %31, !dbg !157, !llvm.loop !158

112:                                              ; preds = %31
  br label %119, !dbg !160

113:                                              ; preds = %27
  %114 = load i64, i64* %6, align 8, !dbg !161
  %115 = load i64, i64* %7, align 8, !dbg !162
  %116 = load double*, double** %8, align 8, !dbg !163
  %117 = load double*, double** %9, align 8, !dbg !164
  %118 = load double*, double** %10, align 8, !dbg !165
  call void @trans_basic(i64 noundef %114, i64 noundef %115, double* noundef %116, double* noundef %117, double* noundef %118), !dbg !166
  br label %119

119:                                              ; preds = %113, %112
  br label %126, !dbg !167

120:                                              ; preds = %5
  %121 = load i64, i64* %6, align 8, !dbg !168
  %122 = load i64, i64* %7, align 8, !dbg !169
  %123 = load double*, double** %8, align 8, !dbg !170
  %124 = load double*, double** %9, align 8, !dbg !171
  %125 = load double*, double** %10, align 8, !dbg !172
  call void @trans_tmp(i64 noundef %121, i64 noundef %122, double* noundef %123, double* noundef %124, double* noundef %125), !dbg !173
  br label %126

126:                                              ; preds = %120, %119
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @trans_basic(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !175 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !176, metadata !DIExpression()), !dbg !177
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !178, metadata !DIExpression()), !dbg !179
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !180, metadata !DIExpression()), !dbg !181
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !182, metadata !DIExpression()), !dbg !183
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !184, metadata !DIExpression()), !dbg !185
  %13 = load i64, i64* %7, align 8, !dbg !186
  %14 = load i64, i64* %6, align 8, !dbg !187
  %15 = load i64, i64* %6, align 8, !dbg !188
  %16 = load i64, i64* %7, align 8, !dbg !189
  %17 = load i64, i64* %6, align 8, !dbg !190
  %18 = icmp ugt i64 %17, 0, !dbg !190
  br i1 %18, label %19, label %20, !dbg !190

19:                                               ; preds = %5
  br label %22, !dbg !190

20:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 83, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !190
  unreachable, !dbg !190

21:                                               ; No predecessors!
  br label %22, !dbg !190

22:                                               ; preds = %21, %19
  %23 = load i64, i64* %7, align 8, !dbg !191
  %24 = icmp ugt i64 %23, 0, !dbg !191
  br i1 %24, label %25, label %26, !dbg !191

25:                                               ; preds = %22
  br label %28, !dbg !191

26:                                               ; preds = %22
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 84, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !191
  unreachable, !dbg !191

27:                                               ; No predecessors!
  br label %28, !dbg !191

28:                                               ; preds = %27, %25
  call void @llvm.dbg.declare(metadata i64* %11, metadata !192, metadata !DIExpression()), !dbg !194
  store i64 0, i64* %11, align 8, !dbg !194
  br label %29, !dbg !195

29:                                               ; preds = %56, %28
  %30 = load i64, i64* %11, align 8, !dbg !196
  %31 = load i64, i64* %7, align 8, !dbg !198
  %32 = icmp ult i64 %30, %31, !dbg !199
  br i1 %32, label %33, label %59, !dbg !200

33:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata i64* %12, metadata !201, metadata !DIExpression()), !dbg !204
  store i64 0, i64* %12, align 8, !dbg !204
  br label %34, !dbg !205

34:                                               ; preds = %52, %33
  %35 = load i64, i64* %12, align 8, !dbg !206
  %36 = load i64, i64* %6, align 8, !dbg !208
  %37 = icmp ult i64 %35, %36, !dbg !209
  br i1 %37, label %38, label %55, !dbg !210

38:                                               ; preds = %34
  %39 = load double*, double** %8, align 8, !dbg !211
  %40 = load i64, i64* %11, align 8, !dbg !213
  %41 = mul nsw i64 %40, %14, !dbg !211
  %42 = getelementptr inbounds double, double* %39, i64 %41, !dbg !211
  %43 = load i64, i64* %12, align 8, !dbg !214
  %44 = getelementptr inbounds double, double* %42, i64 %43, !dbg !211
  %45 = load double, double* %44, align 8, !dbg !211
  %46 = load double*, double** %9, align 8, !dbg !215
  %47 = load i64, i64* %12, align 8, !dbg !216
  %48 = mul nsw i64 %47, %16, !dbg !215
  %49 = getelementptr inbounds double, double* %46, i64 %48, !dbg !215
  %50 = load i64, i64* %11, align 8, !dbg !217
  %51 = getelementptr inbounds double, double* %49, i64 %50, !dbg !215
  store double %45, double* %51, align 8, !dbg !218
  br label %52, !dbg !219

52:                                               ; preds = %38
  %53 = load i64, i64* %12, align 8, !dbg !220
  %54 = add i64 %53, 1, !dbg !220
  store i64 %54, i64* %12, align 8, !dbg !220
  br label %34, !dbg !221, !llvm.loop !222

55:                                               ; preds = %34
  br label %56, !dbg !224

56:                                               ; preds = %55
  %57 = load i64, i64* %11, align 8, !dbg !225
  %58 = add i64 %57, 1, !dbg !225
  store i64 %58, i64* %11, align 8, !dbg !225
  br label %29, !dbg !226, !llvm.loop !227

59:                                               ; preds = %29
  %60 = load i64, i64* %6, align 8, !dbg !229
  %61 = load i64, i64* %7, align 8, !dbg !229
  %62 = load double*, double** %8, align 8, !dbg !229
  %63 = load double*, double** %9, align 8, !dbg !229
  %64 = call zeroext i1 @is_transpose(i64 noundef %60, i64 noundef %61, double* noundef %62, double* noundef %63), !dbg !229
  br i1 %64, label %65, label %66, !dbg !229

65:                                               ; preds = %59
  br label %68, !dbg !229

66:                                               ; preds = %59
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 92, i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @__PRETTY_FUNCTION__.trans_basic, i64 0, i64 0)) #4, !dbg !229
  unreachable, !dbg !229

67:                                               ; No predecessors!
  br label %68, !dbg !229

68:                                               ; preds = %67, %65
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3, double* noundef %4) #0 !dbg !231 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !232, metadata !DIExpression()), !dbg !233
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !234, metadata !DIExpression()), !dbg !235
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !236, metadata !DIExpression()), !dbg !237
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !238, metadata !DIExpression()), !dbg !239
  store double* %4, double** %10, align 8
  call void @llvm.dbg.declare(metadata double** %10, metadata !240, metadata !DIExpression()), !dbg !241
  %15 = load i64, i64* %7, align 8, !dbg !242
  %16 = load i64, i64* %6, align 8, !dbg !243
  %17 = load i64, i64* %6, align 8, !dbg !244
  %18 = load i64, i64* %7, align 8, !dbg !245
  %19 = load i64, i64* %6, align 8, !dbg !246
  %20 = icmp ugt i64 %19, 0, !dbg !246
  br i1 %20, label %21, label %22, !dbg !246

21:                                               ; preds = %5
  br label %24, !dbg !246

22:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 103, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !246
  unreachable, !dbg !246

23:                                               ; No predecessors!
  br label %24, !dbg !246

24:                                               ; preds = %23, %21
  %25 = load i64, i64* %7, align 8, !dbg !247
  %26 = icmp ugt i64 %25, 0, !dbg !247
  br i1 %26, label %27, label %28, !dbg !247

27:                                               ; preds = %24
  br label %30, !dbg !247

28:                                               ; preds = %24
  call void @__assert_fail(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 104, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !247
  unreachable, !dbg !247

29:                                               ; No predecessors!
  br label %30, !dbg !247

30:                                               ; preds = %29, %27
  call void @llvm.dbg.declare(metadata i64* %11, metadata !248, metadata !DIExpression()), !dbg !250
  store i64 0, i64* %11, align 8, !dbg !250
  br label %31, !dbg !251

31:                                               ; preds = %75, %30
  %32 = load i64, i64* %11, align 8, !dbg !252
  %33 = load i64, i64* %7, align 8, !dbg !254
  %34 = icmp ult i64 %32, %33, !dbg !255
  br i1 %34, label %35, label %78, !dbg !256

35:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata i64* %12, metadata !257, metadata !DIExpression()), !dbg !260
  store i64 0, i64* %12, align 8, !dbg !260
  br label %36, !dbg !261

36:                                               ; preds = %71, %35
  %37 = load i64, i64* %12, align 8, !dbg !262
  %38 = load i64, i64* %6, align 8, !dbg !264
  %39 = icmp ult i64 %37, %38, !dbg !265
  br i1 %39, label %40, label %74, !dbg !266

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i64* %13, metadata !267, metadata !DIExpression()), !dbg !269
  %41 = load i64, i64* %11, align 8, !dbg !270
  %42 = urem i64 %41, 2, !dbg !271
  store i64 %42, i64* %13, align 8, !dbg !269
  call void @llvm.dbg.declare(metadata i64* %14, metadata !272, metadata !DIExpression()), !dbg !273
  %43 = load i64, i64* %12, align 8, !dbg !274
  %44 = urem i64 %43, 2, !dbg !275
  store i64 %44, i64* %14, align 8, !dbg !273
  %45 = load double*, double** %8, align 8, !dbg !276
  %46 = load i64, i64* %11, align 8, !dbg !277
  %47 = mul nsw i64 %46, %16, !dbg !276
  %48 = getelementptr inbounds double, double* %45, i64 %47, !dbg !276
  %49 = load i64, i64* %12, align 8, !dbg !278
  %50 = getelementptr inbounds double, double* %48, i64 %49, !dbg !276
  %51 = load double, double* %50, align 8, !dbg !276
  %52 = load double*, double** %10, align 8, !dbg !279
  %53 = load i64, i64* %13, align 8, !dbg !280
  %54 = mul i64 2, %53, !dbg !281
  %55 = load i64, i64* %14, align 8, !dbg !282
  %56 = add i64 %54, %55, !dbg !283
  %57 = getelementptr inbounds double, double* %52, i64 %56, !dbg !279
  store double %51, double* %57, align 8, !dbg !284
  %58 = load double*, double** %10, align 8, !dbg !285
  %59 = load i64, i64* %13, align 8, !dbg !286
  %60 = mul i64 2, %59, !dbg !287
  %61 = load i64, i64* %14, align 8, !dbg !288
  %62 = add i64 %60, %61, !dbg !289
  %63 = getelementptr inbounds double, double* %58, i64 %62, !dbg !285
  %64 = load double, double* %63, align 8, !dbg !285
  %65 = load double*, double** %9, align 8, !dbg !290
  %66 = load i64, i64* %12, align 8, !dbg !291
  %67 = mul nsw i64 %66, %18, !dbg !290
  %68 = getelementptr inbounds double, double* %65, i64 %67, !dbg !290
  %69 = load i64, i64* %11, align 8, !dbg !292
  %70 = getelementptr inbounds double, double* %68, i64 %69, !dbg !290
  store double %64, double* %70, align 8, !dbg !293
  br label %71, !dbg !294

71:                                               ; preds = %40
  %72 = load i64, i64* %12, align 8, !dbg !295
  %73 = add i64 %72, 1, !dbg !295
  store i64 %73, i64* %12, align 8, !dbg !295
  br label %36, !dbg !296, !llvm.loop !297

74:                                               ; preds = %36
  br label %75, !dbg !299

75:                                               ; preds = %74
  %76 = load i64, i64* %11, align 8, !dbg !300
  %77 = add i64 %76, 1, !dbg !300
  store i64 %77, i64* %11, align 8, !dbg !300
  br label %31, !dbg !301, !llvm.loop !302

78:                                               ; preds = %31
  %79 = load i64, i64* %6, align 8, !dbg !304
  %80 = load i64, i64* %7, align 8, !dbg !304
  %81 = load double*, double** %8, align 8, !dbg !304
  %82 = load double*, double** %9, align 8, !dbg !304
  %83 = call zeroext i1 @is_transpose(i64 noundef %79, i64 noundef %80, double* noundef %81, double* noundef %82), !dbg !304
  br i1 %83, label %84, label %85, !dbg !304

84:                                               ; preds = %78
  br label %87, !dbg !304

85:                                               ; preds = %78
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 noundef 115, i8* noundef getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.trans_tmp, i64 0, i64 0)) #4, !dbg !304
  unreachable, !dbg !304

86:                                               ; No predecessors!
  br label %87, !dbg !304

87:                                               ; preds = %86, %84
  ret void, !dbg !305
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @is_transpose(i64 noundef %0, i64 noundef %1, double* noundef %2, double* noundef %3) #0 !dbg !306 {
  %5 = alloca i1, align 1
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !310, metadata !DIExpression()), !dbg !311
  store i64 %1, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !312, metadata !DIExpression()), !dbg !313
  store double* %2, double** %8, align 8
  call void @llvm.dbg.declare(metadata double** %8, metadata !314, metadata !DIExpression()), !dbg !315
  store double* %3, double** %9, align 8
  call void @llvm.dbg.declare(metadata double** %9, metadata !316, metadata !DIExpression()), !dbg !317
  %12 = load i64, i64* %7, align 8, !dbg !318
  %13 = load i64, i64* %6, align 8, !dbg !319
  %14 = load i64, i64* %6, align 8, !dbg !320
  %15 = load i64, i64* %7, align 8, !dbg !321
  call void @llvm.dbg.declare(metadata i64* %10, metadata !322, metadata !DIExpression()), !dbg !324
  store i64 0, i64* %10, align 8, !dbg !324
  br label %16, !dbg !325

16:                                               ; preds = %67, %4
  %17 = load i64, i64* %10, align 8, !dbg !326
  %18 = load i64, i64* %7, align 8, !dbg !328
  %19 = icmp ult i64 %17, %18, !dbg !329
  br i1 %19, label %20, label %70, !dbg !330

20:                                               ; preds = %16
  call void @llvm.dbg.declare(metadata i64* %11, metadata !331, metadata !DIExpression()), !dbg !334
  store i64 0, i64* %11, align 8, !dbg !334
  br label %21, !dbg !335

21:                                               ; preds = %63, %20
  %22 = load i64, i64* %11, align 8, !dbg !336
  %23 = load i64, i64* %6, align 8, !dbg !338
  %24 = icmp ult i64 %22, %23, !dbg !339
  br i1 %24, label %25, label %66, !dbg !340

25:                                               ; preds = %21
  %26 = load double*, double** %8, align 8, !dbg !341
  %27 = load i64, i64* %10, align 8, !dbg !344
  %28 = mul nsw i64 %27, %13, !dbg !341
  %29 = getelementptr inbounds double, double* %26, i64 %28, !dbg !341
  %30 = load i64, i64* %11, align 8, !dbg !345
  %31 = getelementptr inbounds double, double* %29, i64 %30, !dbg !341
  %32 = load double, double* %31, align 8, !dbg !341
  %33 = load double*, double** %9, align 8, !dbg !346
  %34 = load i64, i64* %11, align 8, !dbg !347
  %35 = mul nsw i64 %34, %15, !dbg !346
  %36 = getelementptr inbounds double, double* %33, i64 %35, !dbg !346
  %37 = load i64, i64* %10, align 8, !dbg !348
  %38 = getelementptr inbounds double, double* %36, i64 %37, !dbg !346
  %39 = load double, double* %38, align 8, !dbg !346
  %40 = fcmp une double %32, %39, !dbg !349
  br i1 %40, label %41, label %62, !dbg !350

41:                                               ; preds = %25
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !351
  %43 = load i64, i64* %11, align 8, !dbg !353
  %44 = load i64, i64* %10, align 8, !dbg !354
  %45 = load double*, double** %9, align 8, !dbg !355
  %46 = load i64, i64* %11, align 8, !dbg !356
  %47 = mul nsw i64 %46, %15, !dbg !355
  %48 = getelementptr inbounds double, double* %45, i64 %47, !dbg !355
  %49 = load i64, i64* %10, align 8, !dbg !357
  %50 = getelementptr inbounds double, double* %48, i64 %49, !dbg !355
  %51 = load double, double* %50, align 8, !dbg !355
  %52 = load i64, i64* %10, align 8, !dbg !358
  %53 = load i64, i64* %11, align 8, !dbg !359
  %54 = load double*, double** %8, align 8, !dbg !360
  %55 = load i64, i64* %10, align 8, !dbg !361
  %56 = mul nsw i64 %55, %13, !dbg !360
  %57 = getelementptr inbounds double, double* %54, i64 %56, !dbg !360
  %58 = load i64, i64* %11, align 8, !dbg !362
  %59 = getelementptr inbounds double, double* %57, i64 %58, !dbg !360
  %60 = load double, double* %59, align 8, !dbg !360
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %42, i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @.str.7, i64 0, i64 0), i64 noundef %43, i64 noundef %44, double noundef %51, i64 noundef %52, i64 noundef %53, double noundef %60), !dbg !363
  store i1 false, i1* %5, align 1, !dbg !364
  br label %71, !dbg !364

62:                                               ; preds = %25
  br label %63, !dbg !365

63:                                               ; preds = %62
  %64 = load i64, i64* %11, align 8, !dbg !366
  %65 = add i64 %64, 1, !dbg !366
  store i64 %65, i64* %11, align 8, !dbg !366
  br label %21, !dbg !367, !llvm.loop !368

66:                                               ; preds = %21
  br label %67, !dbg !370

67:                                               ; preds = %66
  %68 = load i64, i64* %10, align 8, !dbg !371
  %69 = add i64 %68, 1, !dbg !371
  store i64 %69, i64* %10, align 8, !dbg !371
  br label %16, !dbg !372, !llvm.loop !373

70:                                               ; preds = %16
  store i1 true, i1* %5, align 1, !dbg !375
  br label %71, !dbg !375

71:                                               ; preds = %70, %41
  %72 = load i1, i1* %5, align 1, !dbg !376
  ret i1 %72, !dbg !376
}

declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr3/tianqiyu/private/15513/cachelab-f23-NickYu321")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 161, type: !11, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocation(line: 163, column: 5, scope: !10)
!15 = !DILocation(line: 166, column: 5, scope: !10)
!16 = !DILocation(line: 167, column: 5, scope: !10)
!17 = !DILocation(line: 168, column: 1, scope: !10)
!18 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 125, type: !19, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !13)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21, !21, !24, !24, !29}
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !23)
!22 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "")
!23 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, elements: !27)
!26 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!27 = !{!28}
!28 = !DISubrange(count: -1)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!30 = !DILocalVariable(name: "M", arg: 1, scope: !18, file: !1, line: 125, type: !21)
!31 = !DILocation(line: 125, column: 37, scope: !18)
!32 = !DILocalVariable(name: "N", arg: 2, scope: !18, file: !1, line: 125, type: !21)
!33 = !DILocation(line: 125, column: 47, scope: !18)
!34 = !DILocalVariable(name: "A", arg: 3, scope: !18, file: !1, line: 125, type: !24)
!35 = !DILocation(line: 125, column: 57, scope: !18)
!36 = !DILocalVariable(name: "B", arg: 4, scope: !18, file: !1, line: 125, type: !24)
!37 = !DILocation(line: 125, column: 73, scope: !18)
!38 = !DILocalVariable(name: "tmp", arg: 5, scope: !18, file: !1, line: 126, type: !29)
!39 = !DILocation(line: 126, column: 37, scope: !18)
!40 = !DILocation(line: 125, column: 59, scope: !18)
!41 = !DILocation(line: 125, column: 62, scope: !18)
!42 = !DILocation(line: 125, column: 75, scope: !18)
!43 = !DILocation(line: 125, column: 78, scope: !18)
!44 = !DILocalVariable(name: "block", scope: !18, file: !1, line: 127, type: !21)
!45 = !DILocation(line: 127, column: 12, scope: !18)
!46 = !DILocalVariable(name: "b", scope: !18, file: !1, line: 129, type: !26)
!47 = !DILocation(line: 129, column: 12, scope: !18)
!48 = !DILocation(line: 130, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !18, file: !1, line: 130, column: 9)
!50 = !DILocation(line: 130, column: 14, scope: !49)
!51 = !DILocation(line: 130, column: 11, scope: !49)
!52 = !DILocation(line: 130, column: 9, scope: !18)
!53 = !DILocation(line: 131, column: 12, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 131, column: 12)
!55 = !DILocation(line: 131, column: 13, scope: !54)
!56 = !DILocation(line: 131, column: 18, scope: !54)
!57 = !DILocation(line: 131, column: 21, scope: !54)
!58 = !DILocation(line: 131, column: 22, scope: !54)
!59 = !DILocation(line: 131, column: 12, scope: !49)
!60 = !DILocalVariable(name: "i_c", scope: !61, file: !1, line: 132, type: !21)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 132, column: 13)
!62 = distinct !DILexicalBlock(scope: !54, file: !1, line: 131, column: 29)
!63 = !DILocation(line: 132, column: 24, scope: !61)
!64 = !DILocation(line: 132, column: 17, scope: !61)
!65 = !DILocation(line: 132, column: 33, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !1, line: 132, column: 13)
!67 = !DILocation(line: 132, column: 39, scope: !66)
!68 = !DILocation(line: 132, column: 37, scope: !66)
!69 = !DILocation(line: 132, column: 13, scope: !61)
!70 = !DILocalVariable(name: "j_c", scope: !71, file: !1, line: 133, type: !21)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 133, column: 13)
!72 = distinct !DILexicalBlock(scope: !66, file: !1, line: 132, column: 55)
!73 = !DILocation(line: 133, column: 24, scope: !71)
!74 = !DILocation(line: 133, column: 17, scope: !71)
!75 = !DILocation(line: 133, column: 33, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 133, column: 13)
!77 = !DILocation(line: 133, column: 39, scope: !76)
!78 = !DILocation(line: 133, column: 37, scope: !76)
!79 = !DILocation(line: 133, column: 13, scope: !71)
!80 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 134, type: !21)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 134, column: 17)
!82 = distinct !DILexicalBlock(scope: !76, file: !1, line: 133, column: 55)
!83 = !DILocation(line: 134, column: 28, scope: !81)
!84 = !DILocation(line: 134, column: 32, scope: !81)
!85 = !DILocation(line: 134, column: 21, scope: !81)
!86 = !DILocation(line: 134, column: 37, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !1, line: 134, column: 17)
!88 = !DILocation(line: 134, column: 41, scope: !87)
!89 = !DILocation(line: 134, column: 47, scope: !87)
!90 = !DILocation(line: 134, column: 45, scope: !87)
!91 = !DILocation(line: 134, column: 39, scope: !87)
!92 = !DILocation(line: 134, column: 17, scope: !81)
!93 = !DILocalVariable(name: "j", scope: !94, file: !1, line: 135, type: !21)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 135, column: 21)
!95 = distinct !DILexicalBlock(scope: !87, file: !1, line: 134, column: 61)
!96 = !DILocation(line: 135, column: 32, scope: !94)
!97 = !DILocation(line: 135, column: 36, scope: !94)
!98 = !DILocation(line: 135, column: 25, scope: !94)
!99 = !DILocation(line: 135, column: 41, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !1, line: 135, column: 21)
!101 = !DILocation(line: 135, column: 45, scope: !100)
!102 = !DILocation(line: 135, column: 51, scope: !100)
!103 = !DILocation(line: 135, column: 49, scope: !100)
!104 = !DILocation(line: 135, column: 43, scope: !100)
!105 = !DILocation(line: 135, column: 21, scope: !94)
!106 = !DILocation(line: 136, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 136, column: 28)
!108 = distinct !DILexicalBlock(scope: !100, file: !1, line: 135, column: 64)
!109 = !DILocation(line: 136, column: 32, scope: !107)
!110 = !DILocation(line: 136, column: 30, scope: !107)
!111 = !DILocation(line: 136, column: 28, scope: !108)
!112 = !DILocation(line: 137, column: 37, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !1, line: 136, column: 34)
!114 = !DILocation(line: 137, column: 39, scope: !113)
!115 = !DILocation(line: 137, column: 42, scope: !113)
!116 = !DILocation(line: 137, column: 29, scope: !113)
!117 = !DILocation(line: 137, column: 31, scope: !113)
!118 = !DILocation(line: 137, column: 34, scope: !113)
!119 = !DILocation(line: 137, column: 36, scope: !113)
!120 = !DILocation(line: 138, column: 25, scope: !113)
!121 = !DILocation(line: 139, column: 33, scope: !122)
!122 = distinct !DILexicalBlock(scope: !107, file: !1, line: 138, column: 30)
!123 = !DILocation(line: 139, column: 35, scope: !122)
!124 = !DILocation(line: 139, column: 38, scope: !122)
!125 = !DILocation(line: 139, column: 31, scope: !122)
!126 = !DILocation(line: 141, column: 21, scope: !108)
!127 = !DILocation(line: 135, column: 60, scope: !100)
!128 = !DILocation(line: 135, column: 21, scope: !100)
!129 = distinct !{!129, !105, !130}
!130 = !DILocation(line: 141, column: 21, scope: !94)
!131 = !DILocation(line: 142, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !95, file: !1, line: 142, column: 24)
!133 = !DILocation(line: 142, column: 29, scope: !132)
!134 = !DILocation(line: 142, column: 27, scope: !132)
!135 = !DILocation(line: 142, column: 24, scope: !95)
!136 = !DILocation(line: 143, column: 34, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !1, line: 142, column: 33)
!138 = !DILocation(line: 143, column: 25, scope: !137)
!139 = !DILocation(line: 143, column: 27, scope: !137)
!140 = !DILocation(line: 143, column: 30, scope: !137)
!141 = !DILocation(line: 143, column: 32, scope: !137)
!142 = !DILocation(line: 144, column: 21, scope: !137)
!143 = !DILocation(line: 145, column: 17, scope: !95)
!144 = !DILocation(line: 134, column: 56, scope: !87)
!145 = !DILocation(line: 134, column: 17, scope: !87)
!146 = distinct !{!146, !92, !147}
!147 = !DILocation(line: 145, column: 17, scope: !81)
!148 = !DILocation(line: 146, column: 13, scope: !82)
!149 = !DILocation(line: 133, column: 49, scope: !76)
!150 = !DILocation(line: 133, column: 46, scope: !76)
!151 = !DILocation(line: 133, column: 13, scope: !76)
!152 = distinct !{!152, !79, !153}
!153 = !DILocation(line: 146, column: 13, scope: !71)
!154 = !DILocation(line: 147, column: 9, scope: !72)
!155 = !DILocation(line: 132, column: 49, scope: !66)
!156 = !DILocation(line: 132, column: 46, scope: !66)
!157 = !DILocation(line: 132, column: 13, scope: !66)
!158 = distinct !{!158, !69, !159}
!159 = !DILocation(line: 147, column: 9, scope: !61)
!160 = !DILocation(line: 148, column: 9, scope: !62)
!161 = !DILocation(line: 148, column: 27, scope: !54)
!162 = !DILocation(line: 148, column: 30, scope: !54)
!163 = !DILocation(line: 148, column: 33, scope: !54)
!164 = !DILocation(line: 148, column: 36, scope: !54)
!165 = !DILocation(line: 148, column: 39, scope: !54)
!166 = !DILocation(line: 148, column: 15, scope: !54)
!167 = !DILocation(line: 131, column: 24, scope: !54)
!168 = !DILocation(line: 151, column: 19, scope: !49)
!169 = !DILocation(line: 151, column: 22, scope: !49)
!170 = !DILocation(line: 151, column: 25, scope: !49)
!171 = !DILocation(line: 151, column: 28, scope: !49)
!172 = !DILocation(line: 151, column: 31, scope: !49)
!173 = !DILocation(line: 151, column: 9, scope: !49)
!174 = !DILocation(line: 152, column: 1, scope: !18)
!175 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !19, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !13)
!176 = !DILocalVariable(name: "M", arg: 1, scope: !175, file: !1, line: 81, type: !21)
!177 = !DILocation(line: 81, column: 32, scope: !175)
!178 = !DILocalVariable(name: "N", arg: 2, scope: !175, file: !1, line: 81, type: !21)
!179 = !DILocation(line: 81, column: 42, scope: !175)
!180 = !DILocalVariable(name: "A", arg: 3, scope: !175, file: !1, line: 81, type: !24)
!181 = !DILocation(line: 81, column: 52, scope: !175)
!182 = !DILocalVariable(name: "B", arg: 4, scope: !175, file: !1, line: 81, type: !24)
!183 = !DILocation(line: 81, column: 68, scope: !175)
!184 = !DILocalVariable(name: "tmp", arg: 5, scope: !175, file: !1, line: 82, type: !29)
!185 = !DILocation(line: 82, column: 32, scope: !175)
!186 = !DILocation(line: 81, column: 54, scope: !175)
!187 = !DILocation(line: 81, column: 57, scope: !175)
!188 = !DILocation(line: 81, column: 70, scope: !175)
!189 = !DILocation(line: 81, column: 73, scope: !175)
!190 = !DILocation(line: 83, column: 5, scope: !175)
!191 = !DILocation(line: 84, column: 5, scope: !175)
!192 = !DILocalVariable(name: "i", scope: !193, file: !1, line: 86, type: !21)
!193 = distinct !DILexicalBlock(scope: !175, file: !1, line: 86, column: 5)
!194 = !DILocation(line: 86, column: 17, scope: !193)
!195 = !DILocation(line: 86, column: 10, scope: !193)
!196 = !DILocation(line: 86, column: 24, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !1, line: 86, column: 5)
!198 = !DILocation(line: 86, column: 28, scope: !197)
!199 = !DILocation(line: 86, column: 26, scope: !197)
!200 = !DILocation(line: 86, column: 5, scope: !193)
!201 = !DILocalVariable(name: "j", scope: !202, file: !1, line: 87, type: !21)
!202 = distinct !DILexicalBlock(scope: !203, file: !1, line: 87, column: 9)
!203 = distinct !DILexicalBlock(scope: !197, file: !1, line: 86, column: 36)
!204 = !DILocation(line: 87, column: 21, scope: !202)
!205 = !DILocation(line: 87, column: 14, scope: !202)
!206 = !DILocation(line: 87, column: 28, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !1, line: 87, column: 9)
!208 = !DILocation(line: 87, column: 32, scope: !207)
!209 = !DILocation(line: 87, column: 30, scope: !207)
!210 = !DILocation(line: 87, column: 9, scope: !202)
!211 = !DILocation(line: 88, column: 23, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !1, line: 87, column: 40)
!213 = !DILocation(line: 88, column: 25, scope: !212)
!214 = !DILocation(line: 88, column: 28, scope: !212)
!215 = !DILocation(line: 88, column: 13, scope: !212)
!216 = !DILocation(line: 88, column: 15, scope: !212)
!217 = !DILocation(line: 88, column: 18, scope: !212)
!218 = !DILocation(line: 88, column: 21, scope: !212)
!219 = !DILocation(line: 89, column: 9, scope: !212)
!220 = !DILocation(line: 87, column: 36, scope: !207)
!221 = !DILocation(line: 87, column: 9, scope: !207)
!222 = distinct !{!222, !210, !223}
!223 = !DILocation(line: 89, column: 9, scope: !202)
!224 = !DILocation(line: 90, column: 5, scope: !203)
!225 = !DILocation(line: 86, column: 32, scope: !197)
!226 = !DILocation(line: 86, column: 5, scope: !197)
!227 = distinct !{!227, !200, !228}
!228 = !DILocation(line: 90, column: 5, scope: !193)
!229 = !DILocation(line: 92, column: 5, scope: !175)
!230 = !DILocation(line: 93, column: 1, scope: !175)
!231 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !19, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !13)
!232 = !DILocalVariable(name: "M", arg: 1, scope: !231, file: !1, line: 101, type: !21)
!233 = !DILocation(line: 101, column: 30, scope: !231)
!234 = !DILocalVariable(name: "N", arg: 2, scope: !231, file: !1, line: 101, type: !21)
!235 = !DILocation(line: 101, column: 40, scope: !231)
!236 = !DILocalVariable(name: "A", arg: 3, scope: !231, file: !1, line: 101, type: !24)
!237 = !DILocation(line: 101, column: 50, scope: !231)
!238 = !DILocalVariable(name: "B", arg: 4, scope: !231, file: !1, line: 101, type: !24)
!239 = !DILocation(line: 101, column: 66, scope: !231)
!240 = !DILocalVariable(name: "tmp", arg: 5, scope: !231, file: !1, line: 102, type: !29)
!241 = !DILocation(line: 102, column: 30, scope: !231)
!242 = !DILocation(line: 101, column: 52, scope: !231)
!243 = !DILocation(line: 101, column: 55, scope: !231)
!244 = !DILocation(line: 101, column: 68, scope: !231)
!245 = !DILocation(line: 101, column: 71, scope: !231)
!246 = !DILocation(line: 103, column: 5, scope: !231)
!247 = !DILocation(line: 104, column: 5, scope: !231)
!248 = !DILocalVariable(name: "i", scope: !249, file: !1, line: 106, type: !21)
!249 = distinct !DILexicalBlock(scope: !231, file: !1, line: 106, column: 5)
!250 = !DILocation(line: 106, column: 17, scope: !249)
!251 = !DILocation(line: 106, column: 10, scope: !249)
!252 = !DILocation(line: 106, column: 24, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !1, line: 106, column: 5)
!254 = !DILocation(line: 106, column: 28, scope: !253)
!255 = !DILocation(line: 106, column: 26, scope: !253)
!256 = !DILocation(line: 106, column: 5, scope: !249)
!257 = !DILocalVariable(name: "j", scope: !258, file: !1, line: 107, type: !21)
!258 = distinct !DILexicalBlock(scope: !259, file: !1, line: 107, column: 9)
!259 = distinct !DILexicalBlock(scope: !253, file: !1, line: 106, column: 36)
!260 = !DILocation(line: 107, column: 21, scope: !258)
!261 = !DILocation(line: 107, column: 14, scope: !258)
!262 = !DILocation(line: 107, column: 28, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !1, line: 107, column: 9)
!264 = !DILocation(line: 107, column: 32, scope: !263)
!265 = !DILocation(line: 107, column: 30, scope: !263)
!266 = !DILocation(line: 107, column: 9, scope: !258)
!267 = !DILocalVariable(name: "di", scope: !268, file: !1, line: 108, type: !21)
!268 = distinct !DILexicalBlock(scope: !263, file: !1, line: 107, column: 40)
!269 = !DILocation(line: 108, column: 20, scope: !268)
!270 = !DILocation(line: 108, column: 25, scope: !268)
!271 = !DILocation(line: 108, column: 27, scope: !268)
!272 = !DILocalVariable(name: "dj", scope: !268, file: !1, line: 109, type: !21)
!273 = !DILocation(line: 109, column: 20, scope: !268)
!274 = !DILocation(line: 109, column: 25, scope: !268)
!275 = !DILocation(line: 109, column: 27, scope: !268)
!276 = !DILocation(line: 110, column: 32, scope: !268)
!277 = !DILocation(line: 110, column: 34, scope: !268)
!278 = !DILocation(line: 110, column: 37, scope: !268)
!279 = !DILocation(line: 110, column: 13, scope: !268)
!280 = !DILocation(line: 110, column: 21, scope: !268)
!281 = !DILocation(line: 110, column: 19, scope: !268)
!282 = !DILocation(line: 110, column: 26, scope: !268)
!283 = !DILocation(line: 110, column: 24, scope: !268)
!284 = !DILocation(line: 110, column: 30, scope: !268)
!285 = !DILocation(line: 111, column: 23, scope: !268)
!286 = !DILocation(line: 111, column: 31, scope: !268)
!287 = !DILocation(line: 111, column: 29, scope: !268)
!288 = !DILocation(line: 111, column: 36, scope: !268)
!289 = !DILocation(line: 111, column: 34, scope: !268)
!290 = !DILocation(line: 111, column: 13, scope: !268)
!291 = !DILocation(line: 111, column: 15, scope: !268)
!292 = !DILocation(line: 111, column: 18, scope: !268)
!293 = !DILocation(line: 111, column: 21, scope: !268)
!294 = !DILocation(line: 112, column: 9, scope: !268)
!295 = !DILocation(line: 107, column: 36, scope: !263)
!296 = !DILocation(line: 107, column: 9, scope: !263)
!297 = distinct !{!297, !266, !298}
!298 = !DILocation(line: 112, column: 9, scope: !258)
!299 = !DILocation(line: 113, column: 5, scope: !259)
!300 = !DILocation(line: 106, column: 32, scope: !253)
!301 = !DILocation(line: 106, column: 5, scope: !253)
!302 = distinct !{!302, !256, !303}
!303 = !DILocation(line: 113, column: 5, scope: !249)
!304 = !DILocation(line: 115, column: 5, scope: !231)
!305 = !DILocation(line: 116, column: 1, scope: !231)
!306 = distinct !DISubprogram(name: "is_transpose", scope: !1, file: !1, line: 52, type: !307, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !13)
!307 = !DISubroutineType(types: !308)
!308 = !{!309, !21, !21, !24, !24}
!309 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!310 = !DILocalVariable(name: "M", arg: 1, scope: !306, file: !1, line: 52, type: !21)
!311 = !DILocation(line: 52, column: 33, scope: !306)
!312 = !DILocalVariable(name: "N", arg: 2, scope: !306, file: !1, line: 52, type: !21)
!313 = !DILocation(line: 52, column: 43, scope: !306)
!314 = !DILocalVariable(name: "A", arg: 3, scope: !306, file: !1, line: 52, type: !24)
!315 = !DILocation(line: 52, column: 53, scope: !306)
!316 = !DILocalVariable(name: "B", arg: 4, scope: !306, file: !1, line: 52, type: !24)
!317 = !DILocation(line: 52, column: 69, scope: !306)
!318 = !DILocation(line: 52, column: 55, scope: !306)
!319 = !DILocation(line: 52, column: 58, scope: !306)
!320 = !DILocation(line: 52, column: 71, scope: !306)
!321 = !DILocation(line: 52, column: 74, scope: !306)
!322 = !DILocalVariable(name: "i", scope: !323, file: !1, line: 53, type: !21)
!323 = distinct !DILexicalBlock(scope: !306, file: !1, line: 53, column: 5)
!324 = !DILocation(line: 53, column: 17, scope: !323)
!325 = !DILocation(line: 53, column: 10, scope: !323)
!326 = !DILocation(line: 53, column: 24, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !1, line: 53, column: 5)
!328 = !DILocation(line: 53, column: 28, scope: !327)
!329 = !DILocation(line: 53, column: 26, scope: !327)
!330 = !DILocation(line: 53, column: 5, scope: !323)
!331 = !DILocalVariable(name: "j", scope: !332, file: !1, line: 54, type: !21)
!332 = distinct !DILexicalBlock(scope: !333, file: !1, line: 54, column: 9)
!333 = distinct !DILexicalBlock(scope: !327, file: !1, line: 53, column: 36)
!334 = !DILocation(line: 54, column: 21, scope: !332)
!335 = !DILocation(line: 54, column: 14, scope: !332)
!336 = !DILocation(line: 54, column: 28, scope: !337)
!337 = distinct !DILexicalBlock(scope: !332, file: !1, line: 54, column: 9)
!338 = !DILocation(line: 54, column: 32, scope: !337)
!339 = !DILocation(line: 54, column: 30, scope: !337)
!340 = !DILocation(line: 54, column: 9, scope: !332)
!341 = !DILocation(line: 55, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !343, file: !1, line: 55, column: 17)
!343 = distinct !DILexicalBlock(scope: !337, file: !1, line: 54, column: 40)
!344 = !DILocation(line: 55, column: 19, scope: !342)
!345 = !DILocation(line: 55, column: 22, scope: !342)
!346 = !DILocation(line: 55, column: 28, scope: !342)
!347 = !DILocation(line: 55, column: 30, scope: !342)
!348 = !DILocation(line: 55, column: 33, scope: !342)
!349 = !DILocation(line: 55, column: 25, scope: !342)
!350 = !DILocation(line: 55, column: 17, scope: !343)
!351 = !DILocation(line: 56, column: 25, scope: !352)
!352 = distinct !DILexicalBlock(scope: !342, file: !1, line: 55, column: 37)
!353 = !DILocation(line: 59, column: 25, scope: !352)
!354 = !DILocation(line: 59, column: 28, scope: !352)
!355 = !DILocation(line: 59, column: 31, scope: !352)
!356 = !DILocation(line: 59, column: 33, scope: !352)
!357 = !DILocation(line: 59, column: 36, scope: !352)
!358 = !DILocation(line: 59, column: 40, scope: !352)
!359 = !DILocation(line: 59, column: 43, scope: !352)
!360 = !DILocation(line: 59, column: 46, scope: !352)
!361 = !DILocation(line: 59, column: 48, scope: !352)
!362 = !DILocation(line: 59, column: 51, scope: !352)
!363 = !DILocation(line: 56, column: 17, scope: !352)
!364 = !DILocation(line: 60, column: 17, scope: !352)
!365 = !DILocation(line: 62, column: 9, scope: !343)
!366 = !DILocation(line: 54, column: 35, scope: !337)
!367 = !DILocation(line: 54, column: 9, scope: !337)
!368 = distinct !{!368, !340, !369}
!369 = !DILocation(line: 62, column: 9, scope: !332)
!370 = !DILocation(line: 63, column: 5, scope: !333)
!371 = !DILocation(line: 53, column: 32, scope: !327)
!372 = !DILocation(line: 53, column: 5, scope: !327)
!373 = distinct !{!373, !330, !374}
!374 = !DILocation(line: 63, column: 5, scope: !323)
!375 = !DILocation(line: 64, column: 5, scope: !306)
!376 = !DILocation(line: 65, column: 1, scope: !306)
