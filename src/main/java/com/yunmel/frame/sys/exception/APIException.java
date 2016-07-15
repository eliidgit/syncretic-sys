package com.yunmel.frame.sys.exception;

import com.yunmel.frame.common.ErrorCode;
import com.yunmel.syncretic.exception.BaseException;

public class APIException extends BaseException {
  private static final long serialVersionUID = -6088706359623184954L;

  public APIException(ErrorCode ec) {
    super(ec.getCode(), ec.getDesc());
  }

  public APIException(ErrorCode ec,Throwable cause) {
    super(ec.getCode(), ec.getDesc(),cause);
  }

}
