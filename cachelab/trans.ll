; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @registerFunctions() local_unnamed_addr #0 !dbg !9 {
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @transpose_submit, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #4, !dbg !13
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_basic, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !14
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef nonnull @trans_tmp, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !15
  ret void, !dbg !16
}

declare !dbg !17 void @registerTransFunction(void (i64, i64, double*, double*, double*)* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @transpose_submit(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #2 !dbg !36 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !38, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata i64 %1, metadata !39, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata double* %2, metadata !40, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata double* %3, metadata !41, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata double* %4, metadata !42, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata i64 8, metadata !43, metadata !DIExpression()), !dbg !62
  %6 = icmp eq i64 %0, %1, !dbg !63
  br i1 %6, label %7, label %83, !dbg !64

7:                                                ; preds = %5
  switch i64 %0, label %67 [
    i64 1024, label %8
    i64 32, label %8
    i64 0, label %108
  ], !dbg !65

8:                                                ; preds = %7, %7
  br label %9, !dbg !66

9:                                                ; preds = %8, %64
  %10 = phi i64 [ %12, %64 ], [ 0, %8 ]
  %11 = phi double [ %65, %64 ], [ undef, %8 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !45, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata double %11, metadata !44, metadata !DIExpression()), !dbg !62
  %12 = add i64 %10, 8
  %13 = icmp eq i64 %10, -8
  call void @llvm.dbg.value(metadata i64 0, metadata !50, metadata !DIExpression()), !dbg !68
  br i1 %13, label %60, label %14, !dbg !69

14:                                               ; preds = %9, %21
  %15 = phi i64 [ %17, %21 ], [ 0, %9 ]
  %16 = phi double [ %22, %21 ], [ %11, %9 ]
  call void @llvm.dbg.value(metadata i64 %15, metadata !50, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.value(metadata i64 %10, metadata !54, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata double %16, metadata !44, metadata !DIExpression()), !dbg !62
  %17 = add i64 %15, 8
  %18 = icmp eq i64 %15, -8
  %19 = icmp eq i64 %10, %15
  br i1 %18, label %20, label %24, !dbg !71

20:                                               ; preds = %14
  br i1 %19, label %53, label %21, !dbg !72

21:                                               ; preds = %34, %53, %20
  %22 = phi double [ %16, %20 ], [ %16, %53 ], [ %49, %34 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !50, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.value(metadata double undef, metadata !44, metadata !DIExpression()), !dbg !62
  %23 = icmp ult i64 %17, %0, !dbg !73
  br i1 %23, label %14, label %64, !dbg !74, !llvm.loop !75

24:                                               ; preds = %14, %34
  %25 = phi i64 [ %35, %34 ], [ %10, %14 ]
  %26 = phi double [ %49, %34 ], [ %16, %14 ]
  call void @llvm.dbg.value(metadata i64 %25, metadata !54, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata i64 %15, metadata !58, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.value(metadata double %26, metadata !44, metadata !DIExpression()), !dbg !62
  %27 = mul nsw i64 %25, %0
  %28 = getelementptr inbounds double, double* %2, i64 %27
  %29 = getelementptr inbounds double, double* %3, i64 %25
  %30 = getelementptr inbounds double, double* %28, i64 %25
  br label %37, !dbg !71

31:                                               ; preds = %52
  %32 = getelementptr inbounds double, double* %3, i64 %27, !dbg !79
  %33 = getelementptr inbounds double, double* %32, i64 %25, !dbg !79
  store double %49, double* %33, align 8, !dbg !82, !tbaa !83
  br label %34, !dbg !87

34:                                               ; preds = %52, %31
  %35 = add nuw i64 %25, 1, !dbg !88
  call void @llvm.dbg.value(metadata i64 %35, metadata !54, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata double undef, metadata !44, metadata !DIExpression()), !dbg !62
  %36 = icmp ult i64 %35, %12, !dbg !89
  br i1 %36, label %24, label %21, !dbg !69, !llvm.loop !90

37:                                               ; preds = %48, %24
  %38 = phi i64 [ %15, %24 ], [ %50, %48 ]
  %39 = phi double [ %26, %24 ], [ %49, %48 ]
  call void @llvm.dbg.value(metadata i64 %38, metadata !58, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.value(metadata double %39, metadata !44, metadata !DIExpression()), !dbg !62
  %40 = icmp eq i64 %25, %38, !dbg !92
  br i1 %40, label %46, label %41, !dbg !96

41:                                               ; preds = %37
  %42 = getelementptr inbounds double, double* %28, i64 %38, !dbg !97
  %43 = load double, double* %42, align 8, !dbg !97, !tbaa !83
  %44 = mul nsw i64 %38, %0, !dbg !99
  %45 = getelementptr inbounds double, double* %29, i64 %44, !dbg !99
  store double %43, double* %45, align 8, !dbg !100, !tbaa !83
  br label %48, !dbg !101

46:                                               ; preds = %37
  %47 = load double, double* %30, align 8, !dbg !102, !tbaa !83
  call void @llvm.dbg.value(metadata double %47, metadata !44, metadata !DIExpression()), !dbg !62
  br label %48

48:                                               ; preds = %46, %41
  %49 = phi double [ %39, %41 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata double %49, metadata !44, metadata !DIExpression()), !dbg !62
  %50 = add nuw i64 %38, 1, !dbg !104
  call void @llvm.dbg.value(metadata i64 %50, metadata !58, metadata !DIExpression()), !dbg !78
  %51 = icmp ult i64 %50, %17, !dbg !105
  br i1 %51, label %37, label %52, !dbg !71, !llvm.loop !106

52:                                               ; preds = %48
  br i1 %19, label %31, label %34, !dbg !72

53:                                               ; preds = %20, %53
  %54 = phi i64 [ %58, %53 ], [ %10, %20 ]
  call void @llvm.dbg.value(metadata i64 %54, metadata !54, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata i64 %15, metadata !58, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.value(metadata double undef, metadata !44, metadata !DIExpression()), !dbg !62
  %55 = mul nsw i64 %54, %0, !dbg !79
  %56 = getelementptr inbounds double, double* %3, i64 %55, !dbg !79
  %57 = getelementptr inbounds double, double* %56, i64 %54, !dbg !79
  store double %16, double* %57, align 8, !dbg !82, !tbaa !83
  %58 = add nuw i64 %54, 1, !dbg !88
  call void @llvm.dbg.value(metadata i64 %58, metadata !54, metadata !DIExpression()), !dbg !70
  %59 = icmp ult i64 %58, %12, !dbg !89
  br i1 %59, label %53, label %21, !dbg !69, !llvm.loop !90

60:                                               ; preds = %9, %60
  %61 = phi i64 [ %62, %60 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %61, metadata !50, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.value(metadata i64 %10, metadata !54, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata double undef, metadata !44, metadata !DIExpression()), !dbg !62
  %62 = add i64 %61, 8, !dbg !108
  call void @llvm.dbg.value(metadata i64 %62, metadata !50, metadata !DIExpression()), !dbg !68
  %63 = icmp ult i64 %62, %0, !dbg !73
  br i1 %63, label %60, label %64, !dbg !74, !llvm.loop !75

64:                                               ; preds = %21, %60
  %65 = phi double [ %11, %60 ], [ %22, %21 ]
  call void @llvm.dbg.value(metadata i64 %12, metadata !45, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata double %65, metadata !44, metadata !DIExpression()), !dbg !62
  %66 = icmp ult i64 %12, %0, !dbg !109
  br i1 %66, label %9, label %108, !dbg !66, !llvm.loop !110

67:                                               ; preds = %7, %80
  %68 = phi i64 [ %81, %80 ], [ 0, %7 ]
  call void @llvm.dbg.value(metadata i64 %68, metadata !112, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 0, metadata !121, metadata !DIExpression()), !dbg !127
  %69 = mul nsw i64 %68, %0
  %70 = getelementptr inbounds double, double* %2, i64 %69
  %71 = getelementptr inbounds double, double* %3, i64 %68
  br label %72, !dbg !128

72:                                               ; preds = %72, %67
  %73 = phi i64 [ 0, %67 ], [ %78, %72 ]
  call void @llvm.dbg.value(metadata i64 %73, metadata !121, metadata !DIExpression()), !dbg !127
  %74 = getelementptr inbounds double, double* %70, i64 %73, !dbg !129
  %75 = load double, double* %74, align 8, !dbg !129, !tbaa !83
  %76 = mul nsw i64 %73, %0, !dbg !132
  %77 = getelementptr inbounds double, double* %71, i64 %76, !dbg !132
  store double %75, double* %77, align 8, !dbg !133, !tbaa !83
  %78 = add nuw i64 %73, 1, !dbg !134
  call void @llvm.dbg.value(metadata i64 %78, metadata !121, metadata !DIExpression()), !dbg !127
  %79 = icmp eq i64 %78, %0, !dbg !135
  br i1 %79, label %80, label %72, !dbg !128, !llvm.loop !136

80:                                               ; preds = %72
  %81 = add nuw i64 %68, 1, !dbg !138
  call void @llvm.dbg.value(metadata i64 %81, metadata !112, metadata !DIExpression()), !dbg !125
  %82 = icmp eq i64 %81, %0, !dbg !139
  br i1 %82, label %108, label %67, !dbg !140, !llvm.loop !141

83:                                               ; preds = %5
  call void @llvm.dbg.value(metadata i64 %0, metadata !143, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata i64 %1, metadata !146, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata double* %2, metadata !147, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata double* %3, metadata !148, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata double* %4, metadata !149, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata i64 0, metadata !150, metadata !DIExpression()), !dbg !162
  %84 = icmp eq i64 %1, 0, !dbg !163
  %85 = icmp eq i64 %0, 0
  %86 = or i1 %85, %84, !dbg !164
  br i1 %86, label %108, label %87, !dbg !164

87:                                               ; preds = %83, %105
  %88 = phi i64 [ %106, %105 ], [ 0, %83 ]
  call void @llvm.dbg.value(metadata i64 %88, metadata !150, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !165
  %89 = mul nsw i64 %88, %0
  %90 = getelementptr inbounds double, double* %2, i64 %89
  %91 = shl i64 %88, 1
  %92 = and i64 %91, 2
  %93 = getelementptr inbounds double, double* %3, i64 %88
  br label %94, !dbg !166

94:                                               ; preds = %94, %87
  %95 = phi i64 [ 0, %87 ], [ %103, %94 ]
  call void @llvm.dbg.value(metadata i64 %95, metadata !152, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.value(metadata i64 %88, metadata !156, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !167
  %96 = and i64 %95, 1, !dbg !168
  call void @llvm.dbg.value(metadata i64 %96, metadata !159, metadata !DIExpression()), !dbg !167
  %97 = getelementptr inbounds double, double* %90, i64 %95, !dbg !169
  %98 = load double, double* %97, align 8, !dbg !169, !tbaa !83
  %99 = or i64 %96, %92, !dbg !170
  %100 = getelementptr inbounds double, double* %4, i64 %99, !dbg !171
  store double %98, double* %100, align 8, !dbg !172, !tbaa !83
  %101 = mul nsw i64 %95, %1, !dbg !173
  %102 = getelementptr inbounds double, double* %93, i64 %101, !dbg !173
  store double %98, double* %102, align 8, !dbg !174, !tbaa !83
  %103 = add nuw i64 %95, 1, !dbg !175
  call void @llvm.dbg.value(metadata i64 %103, metadata !152, metadata !DIExpression()), !dbg !165
  %104 = icmp eq i64 %103, %0, !dbg !176
  br i1 %104, label %105, label %94, !dbg !166, !llvm.loop !177

105:                                              ; preds = %94
  %106 = add nuw i64 %88, 1, !dbg !179
  call void @llvm.dbg.value(metadata i64 %106, metadata !150, metadata !DIExpression()), !dbg !162
  %107 = icmp eq i64 %106, %1, !dbg !163
  br i1 %107, label %108, label %87, !dbg !164, !llvm.loop !180

108:                                              ; preds = %105, %64, %80, %7, %83
  ret void, !dbg !182
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_basic(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef readnone %4) #2 !dbg !114 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !116, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.value(metadata i64 %1, metadata !117, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.value(metadata double* %2, metadata !118, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.value(metadata double* %3, metadata !119, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.value(metadata double* %4, metadata !120, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.value(metadata i64 0, metadata !112, metadata !DIExpression()), !dbg !184
  %6 = icmp eq i64 %1, 0, !dbg !185
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !186
  br i1 %8, label %55, label %9, !dbg !186

9:                                                ; preds = %5
  %10 = icmp ugt i64 %0, 1
  %11 = icmp eq i64 %1, 1
  %12 = and i1 %10, %11
  %13 = and i64 %0, -2
  %14 = icmp eq i64 %13, %0
  br label %15, !dbg !186

15:                                               ; preds = %9, %52
  %16 = phi i64 [ %53, %52 ], [ 0, %9 ]
  call void @llvm.dbg.value(metadata i64 %16, metadata !112, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i64 0, metadata !121, metadata !DIExpression()), !dbg !187
  %17 = mul i64 %16, %0
  %18 = mul nsw i64 %16, %0
  %19 = getelementptr inbounds double, double* %2, i64 %18
  %20 = getelementptr inbounds double, double* %3, i64 %16
  br i1 %12, label %21, label %42, !dbg !188

21:                                               ; preds = %15
  %22 = add i64 %17, %0
  %23 = getelementptr double, double* %2, i64 %22
  %24 = getelementptr double, double* %2, i64 %17
  %25 = add i64 %16, %0
  %26 = getelementptr double, double* %3, i64 %25
  %27 = getelementptr double, double* %3, i64 %16
  %28 = icmp ult double* %27, %23, !dbg !188
  %29 = icmp ult double* %24, %26, !dbg !188
  %30 = and i1 %28, %29, !dbg !188
  br i1 %30, label %42, label %31

31:                                               ; preds = %21, %31
  %32 = phi i64 [ %39, %31 ], [ 0, %21 ], !dbg !189
  %33 = getelementptr inbounds double, double* %19, i64 %32, !dbg !189
  %34 = bitcast double* %33 to <2 x double>*, !dbg !190
  %35 = load <2 x double>, <2 x double>* %34, align 8, !dbg !190, !tbaa !83, !alias.scope !191
  %36 = mul nsw i64 %32, %1, !dbg !189
  %37 = getelementptr inbounds double, double* %20, i64 %36, !dbg !189
  %38 = bitcast double* %37 to <2 x double>*, !dbg !194
  store <2 x double> %35, <2 x double>* %38, align 8, !dbg !194, !tbaa !83, !alias.scope !195, !noalias !191
  %39 = add nuw i64 %32, 2, !dbg !189
  %40 = icmp eq i64 %39, %13, !dbg !189
  br i1 %40, label %41, label %31, !dbg !189, !llvm.loop !197

41:                                               ; preds = %31
  br i1 %14, label %52, label %42, !dbg !188

42:                                               ; preds = %21, %15, %41
  %43 = phi i64 [ 0, %21 ], [ 0, %15 ], [ %13, %41 ]
  br label %44, !dbg !188

44:                                               ; preds = %42, %44
  %45 = phi i64 [ %50, %44 ], [ %43, %42 ]
  call void @llvm.dbg.value(metadata i64 %45, metadata !121, metadata !DIExpression()), !dbg !187
  %46 = getelementptr inbounds double, double* %19, i64 %45, !dbg !190
  %47 = load double, double* %46, align 8, !dbg !190, !tbaa !83
  %48 = mul nsw i64 %45, %1, !dbg !200
  %49 = getelementptr inbounds double, double* %20, i64 %48, !dbg !200
  store double %47, double* %49, align 8, !dbg !194, !tbaa !83
  %50 = add nuw i64 %45, 1, !dbg !189
  call void @llvm.dbg.value(metadata i64 %50, metadata !121, metadata !DIExpression()), !dbg !187
  %51 = icmp eq i64 %50, %0, !dbg !201
  br i1 %51, label %52, label %44, !dbg !188, !llvm.loop !202

52:                                               ; preds = %44, %41
  %53 = add nuw i64 %16, 1, !dbg !203
  call void @llvm.dbg.value(metadata i64 %53, metadata !112, metadata !DIExpression()), !dbg !184
  %54 = icmp eq i64 %53, %1, !dbg !185
  br i1 %54, label %55, label %15, !dbg !186, !llvm.loop !204

55:                                               ; preds = %52, %5
  ret void, !dbg !206
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define internal void @trans_tmp(i64 noundef %0, i64 noundef %1, double* nocapture noundef readonly %2, double* nocapture noundef writeonly %3, double* nocapture noundef writeonly %4) #2 !dbg !144 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !143, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i64 %1, metadata !146, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata double* %2, metadata !147, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata double* %3, metadata !148, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata double* %4, metadata !149, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata i64 0, metadata !150, metadata !DIExpression()), !dbg !208
  %6 = icmp eq i64 %1, 0, !dbg !209
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !210
  br i1 %8, label %30, label %9, !dbg !210

9:                                                ; preds = %5, %27
  %10 = phi i64 [ %28, %27 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !150, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !211
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = shl i64 %10, 1
  %14 = and i64 %13, 2
  %15 = getelementptr inbounds double, double* %3, i64 %10
  br label %16, !dbg !212

16:                                               ; preds = %9, %16
  %17 = phi i64 [ 0, %9 ], [ %25, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !152, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i64 %10, metadata !156, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !213
  %18 = and i64 %17, 1, !dbg !214
  call void @llvm.dbg.value(metadata i64 %18, metadata !159, metadata !DIExpression()), !dbg !213
  %19 = getelementptr inbounds double, double* %12, i64 %17, !dbg !215
  %20 = load double, double* %19, align 8, !dbg !215, !tbaa !83
  %21 = or i64 %18, %14, !dbg !216
  %22 = getelementptr inbounds double, double* %4, i64 %21, !dbg !217
  store double %20, double* %22, align 8, !dbg !218, !tbaa !83
  %23 = mul nsw i64 %17, %1, !dbg !219
  %24 = getelementptr inbounds double, double* %15, i64 %23, !dbg !219
  store double %20, double* %24, align 8, !dbg !220, !tbaa !83
  %25 = add nuw i64 %17, 1, !dbg !221
  call void @llvm.dbg.value(metadata i64 %25, metadata !152, metadata !DIExpression()), !dbg !211
  %26 = icmp eq i64 %25, %0, !dbg !222
  br i1 %26, label %27, label %16, !dbg !212, !llvm.loop !223

27:                                               ; preds = %16
  %28 = add nuw i64 %10, 1, !dbg !225
  call void @llvm.dbg.value(metadata i64 %28, metadata !150, metadata !DIExpression()), !dbg !208
  %29 = icmp eq i64 %28, %1, !dbg !209
  br i1 %29, label %30, label %9, !dbg !210, !llvm.loop !226

30:                                               ; preds = %27, %5
  ret void, !dbg !228
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr3/tianqiyu/private/15513/cachelab-f23-NickYu321")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!9 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 161, type: !10, scopeLine: 161, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !12)
!10 = !DISubroutineType(types: !11)
!11 = !{null}
!12 = !{}
!13 = !DILocation(line: 163, column: 5, scope: !9)
!14 = !DILocation(line: 166, column: 5, scope: !9)
!15 = !DILocation(line: 167, column: 5, scope: !9)
!16 = !DILocation(line: 168, column: 1, scope: !9)
!17 = !DISubprogram(name: "registerTransFunction", scope: !18, file: !18, line: 99, type: !19, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !12)
!18 = !DIFile(filename: "./cachelab.h", directory: "/afs/andrew.cmu.edu/usr3/tianqiyu/private/15513/cachelab-f23-NickYu321")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21, !33}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24, !24, !27, !27, !32}
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "")
!26 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, elements: !30)
!29 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!30 = !{!31}
!31 = !DISubrange(count: -1)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 125, type: !22, scopeLine: 126, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !37)
!37 = !{!38, !39, !40, !41, !42, !43, !44, !45, !50, !54, !58}
!38 = !DILocalVariable(name: "M", arg: 1, scope: !36, file: !1, line: 125, type: !24)
!39 = !DILocalVariable(name: "N", arg: 2, scope: !36, file: !1, line: 125, type: !24)
!40 = !DILocalVariable(name: "A", arg: 3, scope: !36, file: !1, line: 125, type: !27)
!41 = !DILocalVariable(name: "B", arg: 4, scope: !36, file: !1, line: 125, type: !27)
!42 = !DILocalVariable(name: "tmp", arg: 5, scope: !36, file: !1, line: 126, type: !32)
!43 = !DILocalVariable(name: "block", scope: !36, file: !1, line: 127, type: !24)
!44 = !DILocalVariable(name: "b", scope: !36, file: !1, line: 129, type: !29)
!45 = !DILocalVariable(name: "i_c", scope: !46, file: !1, line: 132, type: !24)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 132, column: 13)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 131, column: 29)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 131, column: 12)
!49 = distinct !DILexicalBlock(scope: !36, file: !1, line: 130, column: 9)
!50 = !DILocalVariable(name: "j_c", scope: !51, file: !1, line: 133, type: !24)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 133, column: 13)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 132, column: 55)
!53 = distinct !DILexicalBlock(scope: !46, file: !1, line: 132, column: 13)
!54 = !DILocalVariable(name: "i", scope: !55, file: !1, line: 134, type: !24)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 134, column: 17)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 133, column: 55)
!57 = distinct !DILexicalBlock(scope: !51, file: !1, line: 133, column: 13)
!58 = !DILocalVariable(name: "j", scope: !59, file: !1, line: 135, type: !24)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 135, column: 21)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 134, column: 61)
!61 = distinct !DILexicalBlock(scope: !55, file: !1, line: 134, column: 17)
!62 = !DILocation(line: 0, scope: !36)
!63 = !DILocation(line: 130, column: 11, scope: !49)
!64 = !DILocation(line: 130, column: 9, scope: !36)
!65 = !DILocation(line: 131, column: 18, scope: !48)
!66 = !DILocation(line: 132, column: 13, scope: !46)
!67 = !DILocation(line: 0, scope: !46)
!68 = !DILocation(line: 0, scope: !51)
!69 = !DILocation(line: 134, column: 17, scope: !55)
!70 = !DILocation(line: 0, scope: !55)
!71 = !DILocation(line: 135, column: 21, scope: !59)
!72 = !DILocation(line: 142, column: 24, scope: !60)
!73 = !DILocation(line: 133, column: 37, scope: !57)
!74 = !DILocation(line: 133, column: 13, scope: !51)
!75 = distinct !{!75, !74, !76, !77}
!76 = !DILocation(line: 146, column: 13, scope: !51)
!77 = !{!"llvm.loop.unroll.disable"}
!78 = !DILocation(line: 0, scope: !59)
!79 = !DILocation(line: 143, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 142, column: 33)
!81 = distinct !DILexicalBlock(scope: !60, file: !1, line: 142, column: 24)
!82 = !DILocation(line: 143, column: 32, scope: !80)
!83 = !{!84, !84, i64 0}
!84 = !{!"double", !85, i64 0}
!85 = !{!"omnipotent char", !86, i64 0}
!86 = !{!"Simple C/C++ TBAA"}
!87 = !DILocation(line: 144, column: 21, scope: !80)
!88 = !DILocation(line: 134, column: 56, scope: !61)
!89 = !DILocation(line: 134, column: 39, scope: !61)
!90 = distinct !{!90, !69, !91, !77}
!91 = !DILocation(line: 145, column: 17, scope: !55)
!92 = !DILocation(line: 136, column: 30, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 136, column: 28)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 135, column: 64)
!95 = distinct !DILexicalBlock(scope: !59, file: !1, line: 135, column: 21)
!96 = !DILocation(line: 136, column: 28, scope: !94)
!97 = !DILocation(line: 137, column: 37, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !1, line: 136, column: 34)
!99 = !DILocation(line: 137, column: 29, scope: !98)
!100 = !DILocation(line: 137, column: 36, scope: !98)
!101 = !DILocation(line: 138, column: 25, scope: !98)
!102 = !DILocation(line: 139, column: 33, scope: !103)
!103 = distinct !DILexicalBlock(scope: !93, file: !1, line: 138, column: 30)
!104 = !DILocation(line: 135, column: 60, scope: !95)
!105 = !DILocation(line: 135, column: 43, scope: !95)
!106 = distinct !{!106, !71, !107, !77}
!107 = !DILocation(line: 141, column: 21, scope: !59)
!108 = !DILocation(line: 133, column: 46, scope: !57)
!109 = !DILocation(line: 132, column: 37, scope: !53)
!110 = distinct !{!110, !66, !111, !77}
!111 = !DILocation(line: 147, column: 9, scope: !46)
!112 = !DILocalVariable(name: "i", scope: !113, file: !1, line: 86, type: !24)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 86, column: 5)
!114 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !22, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !115)
!115 = !{!116, !117, !118, !119, !120, !112, !121}
!116 = !DILocalVariable(name: "M", arg: 1, scope: !114, file: !1, line: 81, type: !24)
!117 = !DILocalVariable(name: "N", arg: 2, scope: !114, file: !1, line: 81, type: !24)
!118 = !DILocalVariable(name: "A", arg: 3, scope: !114, file: !1, line: 81, type: !27)
!119 = !DILocalVariable(name: "B", arg: 4, scope: !114, file: !1, line: 81, type: !27)
!120 = !DILocalVariable(name: "tmp", arg: 5, scope: !114, file: !1, line: 82, type: !32)
!121 = !DILocalVariable(name: "j", scope: !122, file: !1, line: 87, type: !24)
!122 = distinct !DILexicalBlock(scope: !123, file: !1, line: 87, column: 9)
!123 = distinct !DILexicalBlock(scope: !124, file: !1, line: 86, column: 36)
!124 = distinct !DILexicalBlock(scope: !113, file: !1, line: 86, column: 5)
!125 = !DILocation(line: 0, scope: !113, inlinedAt: !126)
!126 = distinct !DILocation(line: 148, column: 15, scope: !48)
!127 = !DILocation(line: 0, scope: !122, inlinedAt: !126)
!128 = !DILocation(line: 87, column: 9, scope: !122, inlinedAt: !126)
!129 = !DILocation(line: 88, column: 23, scope: !130, inlinedAt: !126)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 87, column: 40)
!131 = distinct !DILexicalBlock(scope: !122, file: !1, line: 87, column: 9)
!132 = !DILocation(line: 88, column: 13, scope: !130, inlinedAt: !126)
!133 = !DILocation(line: 88, column: 21, scope: !130, inlinedAt: !126)
!134 = !DILocation(line: 87, column: 36, scope: !131, inlinedAt: !126)
!135 = !DILocation(line: 87, column: 30, scope: !131, inlinedAt: !126)
!136 = distinct !{!136, !128, !137, !77}
!137 = !DILocation(line: 89, column: 9, scope: !122, inlinedAt: !126)
!138 = !DILocation(line: 86, column: 32, scope: !124, inlinedAt: !126)
!139 = !DILocation(line: 86, column: 26, scope: !124, inlinedAt: !126)
!140 = !DILocation(line: 86, column: 5, scope: !113, inlinedAt: !126)
!141 = distinct !{!141, !140, !142, !77}
!142 = !DILocation(line: 90, column: 5, scope: !113, inlinedAt: !126)
!143 = !DILocalVariable(name: "M", arg: 1, scope: !144, file: !1, line: 101, type: !24)
!144 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !22, scopeLine: 102, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !145)
!145 = !{!143, !146, !147, !148, !149, !150, !152, !156, !159}
!146 = !DILocalVariable(name: "N", arg: 2, scope: !144, file: !1, line: 101, type: !24)
!147 = !DILocalVariable(name: "A", arg: 3, scope: !144, file: !1, line: 101, type: !27)
!148 = !DILocalVariable(name: "B", arg: 4, scope: !144, file: !1, line: 101, type: !27)
!149 = !DILocalVariable(name: "tmp", arg: 5, scope: !144, file: !1, line: 102, type: !32)
!150 = !DILocalVariable(name: "i", scope: !151, file: !1, line: 106, type: !24)
!151 = distinct !DILexicalBlock(scope: !144, file: !1, line: 106, column: 5)
!152 = !DILocalVariable(name: "j", scope: !153, file: !1, line: 107, type: !24)
!153 = distinct !DILexicalBlock(scope: !154, file: !1, line: 107, column: 9)
!154 = distinct !DILexicalBlock(scope: !155, file: !1, line: 106, column: 36)
!155 = distinct !DILexicalBlock(scope: !151, file: !1, line: 106, column: 5)
!156 = !DILocalVariable(name: "di", scope: !157, file: !1, line: 108, type: !24)
!157 = distinct !DILexicalBlock(scope: !158, file: !1, line: 107, column: 40)
!158 = distinct !DILexicalBlock(scope: !153, file: !1, line: 107, column: 9)
!159 = !DILocalVariable(name: "dj", scope: !157, file: !1, line: 109, type: !24)
!160 = !DILocation(line: 0, scope: !144, inlinedAt: !161)
!161 = distinct !DILocation(line: 151, column: 9, scope: !49)
!162 = !DILocation(line: 0, scope: !151, inlinedAt: !161)
!163 = !DILocation(line: 106, column: 26, scope: !155, inlinedAt: !161)
!164 = !DILocation(line: 106, column: 5, scope: !151, inlinedAt: !161)
!165 = !DILocation(line: 0, scope: !153, inlinedAt: !161)
!166 = !DILocation(line: 107, column: 9, scope: !153, inlinedAt: !161)
!167 = !DILocation(line: 0, scope: !157, inlinedAt: !161)
!168 = !DILocation(line: 109, column: 27, scope: !157, inlinedAt: !161)
!169 = !DILocation(line: 110, column: 32, scope: !157, inlinedAt: !161)
!170 = !DILocation(line: 110, column: 24, scope: !157, inlinedAt: !161)
!171 = !DILocation(line: 110, column: 13, scope: !157, inlinedAt: !161)
!172 = !DILocation(line: 110, column: 30, scope: !157, inlinedAt: !161)
!173 = !DILocation(line: 111, column: 13, scope: !157, inlinedAt: !161)
!174 = !DILocation(line: 111, column: 21, scope: !157, inlinedAt: !161)
!175 = !DILocation(line: 107, column: 36, scope: !158, inlinedAt: !161)
!176 = !DILocation(line: 107, column: 30, scope: !158, inlinedAt: !161)
!177 = distinct !{!177, !166, !178, !77}
!178 = !DILocation(line: 112, column: 9, scope: !153, inlinedAt: !161)
!179 = !DILocation(line: 106, column: 32, scope: !155, inlinedAt: !161)
!180 = distinct !{!180, !164, !181, !77}
!181 = !DILocation(line: 113, column: 5, scope: !151, inlinedAt: !161)
!182 = !DILocation(line: 152, column: 1, scope: !36)
!183 = !DILocation(line: 0, scope: !114)
!184 = !DILocation(line: 0, scope: !113)
!185 = !DILocation(line: 86, column: 26, scope: !124)
!186 = !DILocation(line: 86, column: 5, scope: !113)
!187 = !DILocation(line: 0, scope: !122)
!188 = !DILocation(line: 87, column: 9, scope: !122)
!189 = !DILocation(line: 87, column: 36, scope: !131)
!190 = !DILocation(line: 88, column: 23, scope: !130)
!191 = !{!192}
!192 = distinct !{!192, !193}
!193 = distinct !{!193, !"LVerDomain"}
!194 = !DILocation(line: 88, column: 21, scope: !130)
!195 = !{!196}
!196 = distinct !{!196, !193}
!197 = distinct !{!197, !188, !198, !77, !199}
!198 = !DILocation(line: 89, column: 9, scope: !122)
!199 = !{!"llvm.loop.isvectorized", i32 1}
!200 = !DILocation(line: 88, column: 13, scope: !130)
!201 = !DILocation(line: 87, column: 30, scope: !131)
!202 = distinct !{!202, !188, !198, !77, !199}
!203 = !DILocation(line: 86, column: 32, scope: !124)
!204 = distinct !{!204, !186, !205, !77}
!205 = !DILocation(line: 90, column: 5, scope: !113)
!206 = !DILocation(line: 93, column: 1, scope: !114)
!207 = !DILocation(line: 0, scope: !144)
!208 = !DILocation(line: 0, scope: !151)
!209 = !DILocation(line: 106, column: 26, scope: !155)
!210 = !DILocation(line: 106, column: 5, scope: !151)
!211 = !DILocation(line: 0, scope: !153)
!212 = !DILocation(line: 107, column: 9, scope: !153)
!213 = !DILocation(line: 0, scope: !157)
!214 = !DILocation(line: 109, column: 27, scope: !157)
!215 = !DILocation(line: 110, column: 32, scope: !157)
!216 = !DILocation(line: 110, column: 24, scope: !157)
!217 = !DILocation(line: 110, column: 13, scope: !157)
!218 = !DILocation(line: 110, column: 30, scope: !157)
!219 = !DILocation(line: 111, column: 13, scope: !157)
!220 = !DILocation(line: 111, column: 21, scope: !157)
!221 = !DILocation(line: 107, column: 36, scope: !158)
!222 = !DILocation(line: 107, column: 30, scope: !158)
!223 = distinct !{!223, !212, !224, !77}
!224 = !DILocation(line: 112, column: 9, scope: !153)
!225 = !DILocation(line: 106, column: 32, scope: !155)
!226 = distinct !{!226, !210, !227, !77}
!227 = !DILocation(line: 113, column: 5, scope: !151)
!228 = !DILocation(line: 116, column: 1, scope: !144)
